module ComponentSerializer
  # Creates a hash of components which will be rendered in the form of a section primary.
  class SectionPrimaryComponentSerializer <BaseComponentSerializer
    # Initialise a section primary component with an array of objects.
    #
    # @param [Array<Hash>] an array of objects, each object is a component or atom.
    # @example [{"heading": 'This is a heading'}, {"image": 'This is an image'}]
    def initialize(components)
      @components = components
    end

    private

    def name
      'section-primary'
    end

    def data
      {
        "components": @components,
      }
    end

  end
end
