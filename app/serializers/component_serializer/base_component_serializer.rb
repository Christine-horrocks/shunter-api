module ComponentSerializer
  class BaseComponentSerializer < BaseSerializer

    def content
      {
        name: name,
        data: data
      }
    end

    def name
      raise "Name can only be called through a specific component serializer, not through the generic base component serializer"
    end

    def data
      raise "Data can only be called through a specific component serializer, not thtough the generic base component serializer."
    end

  end
end
