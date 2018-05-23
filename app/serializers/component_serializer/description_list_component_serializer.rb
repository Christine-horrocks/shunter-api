module ComponentSerializer
  # Creates a hash which has data that can be used to create a description list.
  class DescriptionListComponentSerializer < BaseComponentSerializer
    # Initialise a paragraph component with an array of objects.
    #
    # @param [Array<Hash>] an array of objects, each containing 2 key/ value pairs. The first pair will have the key "medium-name", while the value will be wrapped in <dt> tags. The second key will be "medium-link", with the value being an array of strings to be wrapped in <dd> tags.
    # @example [{ "medium-name": 'email', "medium-link": 'email@email.com' }, { "medium-name": 'phone', "medium-link": '019876' }].
    def initialize(list_items)
      @list_items = list_items
    end

    private

    def name
      'description-list'
    end

    def data
      @list_items
    end

  end
end
