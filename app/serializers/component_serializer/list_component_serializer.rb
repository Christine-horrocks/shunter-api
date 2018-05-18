module ComponentSerializer
  class ListComponentSerializer <BaseSerializer

    # Initialise a list component with an array of objects.
    #
    # @param [String] contains the heading of the list.
    # @param [Array<Hash>] an array of objects, each object is a component or atom.


    def initialize(heading, list_items)
      @heading = heading
      @list_items = list_items
    end

    def to_h
      {
        "name": 'list-component',
        "data":
        {
          "heading": @heading,
          "list-items": @list_items
        }
      }
    end

  end
end
