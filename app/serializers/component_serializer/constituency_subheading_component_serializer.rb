module ComponentSerializer
  class ConstituencySubheadingComponentSerializer <BaseComponentSerializer

    def initialize(constituency)
      @constituency = constituency
    end

    private

    def name
      "constituency-subheading"
    end

    def data
      region
    end

    def region
      region = @constituency.regions.map do |region|
        region.name
      end
      region = region.first
    end

  end
end
