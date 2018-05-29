module ComponentSerializer
  # Creates a hash with a name of card-details and data contents of an array of atom or components hashes.
  class CardDetailsComponentSerializer < BaseComponentSerializer
    # Initialise a card component with an array of objects.
    #
    # @param [Array<Hash>] components an array of objects, each object is a component or atom.
    # @example [{"heading": 'This is a heading'}, {"paragraph": 'This is a paragraph'}]
    def initialize(components)
      @components = components
    end

    private

    def name
      'card-details'
    end

    def data
      {
          "components": @components
      }
    end

  end
end