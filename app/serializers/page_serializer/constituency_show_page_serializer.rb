module PageSerializer
  class ConstituencyShowPageSerializer < PageSerializer::BasePageSerializer

    def initialize(constituency, json_location, member, party, seat_incumbencies)
      @member = member
      @constituency = constituency
      @json_location = json_location
      @party = party
      @seat_incumbencies = seat_incumbencies

    end

    def content
      c = []
      c << ComponentSerializer::ConstituencyHeadingComponentSerializer.new(@constituency).to_h
      c << ComponentSerializer::ConstituencySubheadingComponentSerializer.new(@constituency).to_h
      c << ComponentSerializer::MapComponentSerializer.new(@constituency, @json_location).to_h
      c << {
        name: "people",
        data: [
          ComponentSerializer::PersonComponentSerializer.new(@member, {
            constituency_show_page: true, constituency_name: @constituency.name
            }).to_h
        ]
      }
      c << ComponentSerializer::FormerSeatIncumbenciesComponentSerializer.new(@seat_incumbencies).to_h
      c
    end

  def title
    "#{@constituency.name} "
  end

  end
end
