module ComponentSerializer
  # Creates a hash with a name of track and data contents of an array of atom or components hashs.
  class TrackComponentSerializer < BaseComponentSerializer
    # Initialise a track component with an array of objects.
    #
    # @param [Array<Hash>] an array of objects, each object is a component or atom.
    # @example [{"heading": 'This is a heading'}, {"paragraph": 'This is a paragraph'}]
    def initialize(components)
      @components = components
    end

    private

    def name
      'track'
    end

    def data
      {
        "components": @components
      }
    end

  end
end
