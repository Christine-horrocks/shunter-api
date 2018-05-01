# require_relative '../../rails_helper'
#
# describe PageSerializer::HomehowPageSerializer, vcr: false do
#
#   # let (:member) { double('member', display_name: 'MP for this place',
#   #       graph_id: '121212',
#   #       image_id: '121212',
#   #       former_mp?: false,
#   #       former_lord?: false,
#   #       current_mp?: true,
#   #       current_seat_incumbency: current_seat_incumbency,
#   #       current_lord?: false,
#   #       current_party_membership: current_party_membership ) }
#   # let (:json_location) { "here"}
#   # let (:region) { double('region', first: { name: 'NorthEast' }) }
#   # let (:regions) { double('regions', map: region) }
#   # let (:constituency) { double('constituency', name: "Constituency", regions: regions)}
#   let ( :homepageserializer ) { described_class.new(arguments) }
#
#   context '#to_h' do
#
#       # it 'initializes component serializers' do
#       #   constituency_heading_component_serializer = class_double('ComponentSerializer::ConstituencyHeadingComponentSerializer').as_stubbed_const
#       #   constituency_subheading_component_serializer = class_double('ComponentSerializer::ConstituencySubheadingComponentSerializer').as_stubbed_const
#       #   map_component_serializer = class_double('ComponentSerializer::MapComponentSerializer').as_stubbed_const
#       #   person_component_serializer = class_double('ComponentSerializer::PersonComponentSerializer').as_stubbed_const
#       #   former_seat_incumbencies_component_serializer = class_double('ComponentSerializer::FormerSeatIncumbenciesComponentSerializer').as_stubbed_const
#       #
#       #
#       #   expect(constituency_heading_component_serializer).to receive(:new).with(constituency)
#       #   expect(constituency_subheading_component_serializer).to receive(:new).with(constituency)
#       #   expect(map_component_serializer).to receive(:new).with(constituency, json_location)
#       #   expect(person_component_serializer).to receive(:new).with(member, {
#       #     constituency_show_page: true, constituency_name: constituency.name
#       #     })
#       #   expect(former_seat_incumbencies_component_serializer).to receive(:new).with(seat_incumbencies)
#       #
#       #   constituencyshowpageserializer.to_h
#       # end
#       #
#       # it 'produces a hash containg the data to create a constituency show page' do
#       #   expect(constituencyshowpageserializer.to_h).to eq({:layout=>{:template=>"layout"}, :title=>"Constituency ", :components=>[{:name=>"cookie-banner", :data=>"cookie-banner"}, {:name=>"banner", :data=>"banner"}, {:name=>"header", :data=>"header"}, {:name=>"constituency-heading", :data=>"Constituency"}, {:name=>"constituency-subheading", :data=>{:name=>"NorthEast"}}, {:name=>"map", :data=>{:json_location=>"here"}}, {:name=>"people", :data=>[{:display_name=>"MP for this place", :graph_id=>"121212", :image_url=>"https://api.parliament.uk/Live/photo/121212.jpeg?crop=CU_1:1&amp;width=186&amp;quality=80", :role=>"MP for Constituency", "current_party"=>"Labour"}]}, {:name=>"former-seat-incumbencies", :data=>{:title=>"Former MPs", :"former-seat-incumbency-list"=>[1, 1, 1]}}, {:name=>"footer", :data=>"footer"}]})
#       # end
#
#   end
# end
