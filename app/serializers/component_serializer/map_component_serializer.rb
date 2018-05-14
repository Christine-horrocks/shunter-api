module ComponentSerializer
  class MapComponentSerializer <BaseComponentSerializer

    def initialize(constituency, json_location)
      @constituency = constituency
      @json_location = json_location
    end

    private

    def name
      "map"
    end

    def data
       {
            "constituency-name": t('.constituencies.map.accessibility_title') + @constituency.name,
            "json-location": @json_location,
            "enable-javascript": t('.constituencies.map.enable_javascript')
          }
    end


  end
end
