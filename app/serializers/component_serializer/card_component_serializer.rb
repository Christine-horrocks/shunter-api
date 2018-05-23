module ComponentSerializer
  # Creates a hash with a name of card and data contents of an array of atom or components hashs.
  class CardComponentSerializer < BaseSerializer
    # Initialise a card component with an array of objects.
    #
    # @param [Array<Hash>] an array of objects, each object is a component or atom.
    # @example [{"heading": 'This is a heading'}, {"paragraph": 'This is a paragraph'}]
    def initialize(components)
      @components = components
    end

    private

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
