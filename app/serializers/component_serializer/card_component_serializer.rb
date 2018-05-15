module ComponentSerializer
  class CardComponentSerializer <BaseSerializer

    # Initialise a card component with an array of objects.
    #
    # @param [Array<Hash>] an array of objects, each object is a component or atom.

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
