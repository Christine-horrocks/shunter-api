module ComponentSerializer
  class RolesListComponentSerializer < BaseComponentSerializer
    UL = 'ul'.freeze
    OL = 'ol'.freeze

    def initialize(list_items, css_class = '--pipe', list_type=ComponentSerializer::ListComponentSerializer::UL)
      @list_items = list_items
      @list_type = list_type
      @css_class = css_class
    end

    private

    def name
      "roles-list"
    end

    def data
      {
        "list-type": @list_type,
        "css-class": @css_class,
        "list-items": @list_items
      }
    end

  end
end
