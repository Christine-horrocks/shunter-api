module ComponentSerializer
  class CardComponentSerializer <BaseSerializer

    def initialize(components)
      @components = components
    end

    def to_h
      {
        "name": 'card',
        "data":
        {
          "components": @components,
        }
      }
    end

  end
end
