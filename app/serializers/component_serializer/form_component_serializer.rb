module ComponentSerializer
  class FormComponentSerializer < BaseComponentSerializer
    # Initialise a form component with some information and inner components.
    #
    # @param [String] id an id for that is used for the form.
    # @param [String] action the action for the form.
    # @param [String] method the method for the form.
    # @param [String] inner_div_class the class of the inner div.
    # @param [Array<hash>] components Components that are part of the form.
    def initialize(id, action, method, inner_div_class, components)
      @id = id
      @action = action
      @method = method
      @inner_div_class = inner_div_class
      @components = components
    end

    private

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