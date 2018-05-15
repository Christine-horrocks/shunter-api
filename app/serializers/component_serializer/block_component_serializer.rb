module ComponentSerializer
  class BlockComponentSerializer <BaseSerializer

    # Initialise a block component with an array of objects.
    #
    # @param [Array<Hash>] an array of objects, each object is a component or atom.
    # @param [String] contains the class type of the block, with a default of block.


    def initialize(components, klass = 'block')
      @components = components
      @klass = klass
    end

    def to_h
      {
        "name": 'block',
        "data":
        {
          "klass": @klass,
          "components": @components
        }
      }
    end

  end
end
