class ConstituenciesController < ApplicationController
  before_action :data_check, :build_request, except: :postcode_lookup

  ROUTE_MAP = {
    index:           proc { Parliament::Utils::Helpers::ParliamentHelper.parliament_request.constituency_index },
    show:            proc { |params| Parliament::Utils::Helpers::ParliamentHelper.parliament_request.constituency_by_id.set_url_params({ constituency_id: params[:constituency_id] }) },
    lookup:          proc { |params| Parliament::Utils::Helpers::ParliamentHelper.parliament_request.constituency_lookup.set_url_params({ property: params[:source], value: params[:id] }) },
    a_to_z_current:  proc { Parliament::Utils::Helpers::ParliamentHelper.parliament_request.constituency_current_a_to_z },
    current:         proc { Parliament::Utils::Helpers::ParliamentHelper.parliament_request.constituency_current },
    map:             proc { |params| Parliament::Utils::Helpers::ParliamentHelper.parliament_request.constituency_map.set_url_params({ constituency_id: params[:constituency_id] }) },
    letters:         proc { |params| Parliament::Utils::Helpers::ParliamentHelper.parliament_request.constituency_by_initial.set_url_params({ initial: params[:letter] }) },
    current_letters: proc { |params| Parliament::Utils::Helpers::ParliamentHelper.parliament_request.constituency_current_by_initial.set_url_params({ initial: params[:letter] }) },
    a_to_z:          proc { Parliament::Utils::Helpers::ParliamentHelper.parliament_request.constituency_a_to_z }
  }.freeze

  def index
    @constituencies, @letters = Parliament::Utils::Helpers::FilterHelper.filter_sort(@request, :sort_name, 'ConstituencyGroup', ::Grom::Node::BLANK)
    @constituencies = @constituencies.sort_by { |constituency| constituency.name }
    render_page(PageSerializer::ListPageSerializer.new(@constituencies, ComponentSerializer::ConstituencyComponentSerializer, 'constituencies', @letters))
  end

  def letters
    @constituencies, @letters = Parliament::Utils::Helpers::FilterHelper.filter_sort(@request, :sort_name, 'ConstituencyGroup', ::Grom::Node::BLANK)
    @constituencies = @constituencies.select { |constituency| constituency.current? }.sort_by { |constituency| constituency.name }
    render_page(PageSerializer::ListPageSerializer.new(@constituencies, ComponentSerializer::ConstituencyComponentSerializer, 'constituencies', @letters, params[:letter]))
  end

  # Renders a single constituency given a constituency id.
  # @controller_action_param :constituency_id [String] 8 character identifier that identifies constituency in graph database.
  # @return [Grom::Node] object with type 'https://id.parliament.uk/schema/ConstituencyGroup'.
  def show
    @constituency, @seat_incumbencies, @party = Parliament::Utils::Helpers::FilterHelper.filter(@request, 'ConstituencyGroup', 'SeatIncumbency', 'Party')
    # Instance variable for single MP pages
    @seat_incumbencies
    @single_mp = true
    @constituency = @constituency.first
    @seat_incumbencies = @seat_incumbencies.reverse_sort_by(:start_date)

    @current_incumbency = @seat_incumbencies.shift if !@seat_incumbencies.empty? && @seat_incumbencies.first.current?

    @json_location = constituency_map_path(@constituency.graph_id, format: 'json')

    @current_party = @current_incumbency.member.current_party if @current_incumbency

    @party = @current_party ? @current_party : @party.first
    @region = @constituency.regions.map do |region|
      region.name
    end
    @member = @current_incumbency.member
    @region = @region.first
    render_page(PageSerializer::ConstituencyShowPageSerializer.new(@constituency, @json_location, @member, @party, @seat_incumbencies))
  end

  # Redirects to a single constituency given an external source and an id that identifies this constituency in that source.
  # @controller_action_param :source [String] external source.
  # @controller_action_param :id [String] external id which identifies a constituency.
  def lookup
    @constituency = @request.get.first

    redirect_to constituency_path(@constituency.graph_id)
  end

  # Post method which accepts form parameters from postcode lookup and redirects to constituency_path.
  # @controller_action_param :postcode [String] postcode entered into postcode lookup form.
  # @controller_action_param :constituency_id [String] 8 character identifier that identifies constituency in graph database.
  def postcode_lookup
    flash[:postcode] = params[:postcode]

    redirect_to constituency_path(params[:constituency_id])
  end

  # Renders a constituency that has a constituency area object on map view given a constituency id.
  # Will respond with GeoJSON data using the geosparql-to-geojson gem if JSON is requested.
  # @controller_action_param :constituency_id [String] 8 character identifier that identifies constituency in graph database.
  # @return [Grom::Node] object with type 'https://id.parliament.uk/schema/ConstituencyGroup' which holds a geo polygon.
  # @return [GeosparqlToGeojson::GeoJson] object containing GeoJSON data if JSON is requested.
  def map
    respond_to do |format|
      format.html do
        @constituency = Parliament::Utils::Helpers::FilterHelper.filter(@request, 'ConstituencyGroup').first

        @json_location = constituency_map_path(@constituency.graph_id, format: 'json')
      end

      format.json do
        @constituency = Parliament::Utils::Helpers::RequestHelper.filter_response_data(
          Parliament::Utils::Helpers::ParliamentHelper.parliament_request.constituency_map.set_url_params({ constituency_id: params[:constituency_id] }),
          Parliament::Utils::Helpers::RequestHelper.namespace_uri_schema_path('ConstituencyGroup')
        ).first

        raise ActionController::RoutingError, 'Not Found' unless @constituency.current?

        render json: GeosparqlToGeojson.convert_to_geojson(
          geosparql_values:     @constituency.area.polygon,
          geosparql_properties: {
            name:       @constituency.name,
            start_date: @constituency.start_date,
            end_date:   @constituency.end_date
          },
          reverse: false
        ).geojson
      end
    end
  end

end