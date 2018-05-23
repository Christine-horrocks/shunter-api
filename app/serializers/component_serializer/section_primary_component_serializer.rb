module ComponentSerializer
  class SectionPrimaryComponentSerializer < BaseComponentSerializer

    # Initialise a section primary component with an array of objects.
    #
    # @param [Array<Hash>] components an array of objects, each object is a component or atom.
    def initialize(components)
      @components = components
    end

    private

    def name
      'section-primary'
    end

    def data
      {
          components: @components
      }
    end

  end
end