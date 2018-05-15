module ComponentSerializer
  class RolesListComponentSerializer < BaseComponentSerializer
    UL = 'ul'.freeze
    OL = 'ol'.freeze

    def initialize(current_roles, type='role', list_type=ComponentSerializer::RolesListComponentSerializer::UL, class_type = 'list--pipe')
      @current_roles = current_roles
      @type = type
      @list_type = list_type
      @class_type = class_type
    end

    private

    def name
      "roles-list"
    end

    def data
      {
        "title": t('.people.roles.roles').capitalize,
        "type": @type,
        "list-type": @list_type,
        "class-type": @class_type,
        "list-items": @current_roles
      }
    end

  end
end
