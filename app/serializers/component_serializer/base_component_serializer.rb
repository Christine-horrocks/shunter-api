module ComponentSerializer
  class BaseComponentSerializer < BaseSerializer
    def content
      {
        name: name,
        data: data
      }
    end

    def name
      raise 'You must implement #name'
    end

    def data
      raise 'You must implement #data'
    end
  end
end
