module ComponentSerializer
  # Creates a hash with the name container and data which comprises of another hash containing an array of hashes.
  class ContainerComponentSerializer <  BaseComponentSerializer
    # Initialise a container component with an array of objects.
    #
    # @param [Array<Hash>] an array of objects, each object is a component or atom.
    # @example [{"title": 'Here is my title', "text": 'Here is my text'}, {"title": 'Here is my title', "text": 'Here is my text'}].
    def initialize(components)
      @components = components
    end

    private

    def name
      'container'
    end

    def data
      {
        "components": @components
      }
    end

  end
end
