module PageSerializer
  class ConstituencyShowPageSerializer < PageSerializer::BasePageSerializer

    def initialize(constituency, json_location, member)
      @constituency = constituency
      @json_location = json_location
      @member = member

    end

    def content
      c = []
      c << ComponentSerializer::ConstituencyHeadingComponentSerializer.new(@constituency).to_h
      c << ComponentSerializer::ConstituencySubheadingComponentSerializer.new(@constituency).to_h
      c << ComponentSerializer::MapComponentSerializer.new(@constituency, @json_location).to_h
      c << ComponentSerializer::ConstituencyMPComponentSerializer.new(@member, @constituency).to_h
      c
    end

  def title
    "#{@constituency.name} "
  end

  end
end
