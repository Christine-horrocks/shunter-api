module ComponentSerializer
  class SectionPrimaryComponentSerializer <BaseSerializer

    # Initialise a section primary component with an array of objects.
    #
    # @param [Array<Hash>] an array of objects, each object is a component or atom.
  


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
