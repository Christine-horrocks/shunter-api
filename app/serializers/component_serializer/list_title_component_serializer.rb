module ComponentSerializer
  class ListTitleComponentSerializer < BaseComponentSerializer
    def initialize(objects_name)
      @objects_name = objects_name
    end

    private

    def name
      "heading1"
    end

    def data
      @objects_name.capitalize
    end
  end
end
