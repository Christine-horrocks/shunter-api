module ComponentSerializer
  # Creates a list using the array of objects passed to it. Can be used with atoms and components, inculding cards.
  class ListComponentSerializer < BaseComponentSerializer
    UL = 'ul'.freeze
    OL = 'ol'.freeze
    # Initialise a list component with an array of objects.
    #
    # @param [Array<Hash>] components an array of objects, each object is a component or atom.
    # @example [{"heading": 'This is a heading'}, {"paragraph": 'This is a paragraph'}]
    # @param [String] css_class containing -- and the type of css class for the list.
    # @param [String] list_type indicating if the list is a ordered or unordered list, with a defaultof unordered.
    def initialize(components, css_class = '--pipe', list_type=ComponentSerializer::ListComponentSerializer::UL)
      @components = components
      @css_class = css_class
      @list_type = list_type
    end

    private

    def name
      'list'
    end

    def data
      {
          'list-type': @list_type,
          'css-class': @css_class,
          'components': @components
      }
    end

  end
end