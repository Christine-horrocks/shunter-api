module ComponentSerializer
  # Creates a list using the array of objects passed to it. Can be used with atoms and components, inculdign cards and list items.
  class ListComponentSerializer < BaseSerializer
    UL = 'ul'.freeze
    OL = 'ol'.freeze
    # Initialise a list component with an array of objects.
    #
    # @param [String] contains the heading of the list.
    # @param [Array<Hash>] an array of objects, each object is a component or atom.
    # @example [{"heading": 'This is a heading'}, {"paragraph": 'This is a paragraph'}]
    def initialize(heading, list_items, list_type=ComponentSerializer::RolesListComponentSerializer::UL)
      @heading = heading
      @list_items = list_items
      @list_type = list_type
    end

    def to_h
      {
        "name": 'list-component',
        "data":
        {
          "heading": @heading,
          "list-items": @list_items,
          "list-type": @list_type
        }
      }
    end

  end
end
