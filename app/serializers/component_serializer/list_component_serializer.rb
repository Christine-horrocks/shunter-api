module ComponentSerializer
  # Creates a list using the array of objects passed to it. Can be used with atoms and components, inculding cards.
  class ListComponentSerializer < BaseComponentSerializer
    UL = 'ul'.freeze
    OL = 'ol'.freeze
    # Initialise a list component with an array of objects.
    #
    # @param [Array<Hash>] an array of objects, each object is a component or atom.
    # @example [{"heading": 'This is a heading'}, {"paragraph": 'This is a paragraph'}]
    # @param [String] containing -- and the type of css class for the list.
    # @param [String] indicating if the list is a ordered or unordered list, with a defaultof unordered.
    def initialize(list_items, css_class = '--pipe', list_type=ComponentSerializer::ListComponentSerializer::UL)
      @list_items = list_items
      @css_class = css_class
      @list_type = list_type
    end

    private

    def name
      "list"
    end

    def data
      {
        "list-items": @list_items,
        "css-class": @css_class,
        "list-type": @list_type
      }
    end

  end
end
