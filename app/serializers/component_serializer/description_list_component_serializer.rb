module ComponentSerializer
  class DescriptionListComponentSerializer <BaseSerializer

    # Initialise a paragraph component with an array of objects.
    #
    # @param [Array<Hash>] an array of objects, each containing 2 key/ value pairs. The first pair will have the key "medium-name", while the value will be wrapped in <dt> tags. The second key will be "medium-link", with the value being an array of strings to be wrapped in <dd> tags.

    def initialize(list_items)
      @list_items = list_items
    end

    def to_h
      {
        "name": 'description-list',
        "data": @list_items
      }
    end

  end
end
