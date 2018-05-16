module ComponentSerializer
  class ListComponentSerializer < BaseSerializer
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
