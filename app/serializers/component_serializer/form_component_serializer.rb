module ComponentSerializer
  class FormComponentSerializer < BaseComponentSerializer

    def initialize(id, action, method, inner_div_class, components)
      @id = id
      @action = action
      @method = method
      @inner_div_class = inner_div_class
      @components = components
    end

    def name
      'form'
    end

    def data
      {
          id: @id,
          action: @action,
          method: @method,
         'inner-div-class': @inner_div_class,
          components: @components
      }
    end

  end
end