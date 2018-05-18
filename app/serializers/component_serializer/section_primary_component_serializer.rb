module ComponentSerializer
  class SectionPrimaryComponentSerializer <BaseSerializer

    def initialize(components)
      @components = components
    end

    def to_h
      {
        "name": 'section-primary',
        "data":
        {
          "components": @components,
        }
      }
    end

  end
end
