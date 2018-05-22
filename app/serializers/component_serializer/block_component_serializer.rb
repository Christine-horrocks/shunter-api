module ComponentSerializer
  # Creates a hash with the name block and data which comprises of another hash containing a css class, which can be used to chnage the type of block, and an array of hashes.
  class BlockComponentSerializer <  BaseSerializer
    BLOCK = 'block'.freeze

    # Initialise a block component with an array of objects.
    #
    # @param [Array<Hash>] an array of objects, each object is a component or atom.
    # @example [{"title": 'Here is my title', "text": 'Here is my text'}, {"title": 'Here is my title', "text": 'Here is my text'}].
    # @param [String] contains the class type of the block, with a default of block.
    def initialize(components, css_class = list_type=ComponentSerializer::BlockComponentSerializer::BLOCK)
      @components = components
      @css_class = css_class
    end

    def to_h
      {
        "name": 'block',
        "data":
        {
          "css-class": @css_class,
          "components": @components
        }
      }
    end

  end
end
