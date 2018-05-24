module ComponentSerializer
  class ButtonComponentSerializer < BaseComponentSerializer
    # Initialise a button component with some information.
    #
    # @param [String] css_class the class of the button.
    # @param [String] data_tracking the data_tracking attribute of the button.
    # @param [String] type the type of the button.
    # @param [String] value the value for the button.
    def initialize(css_class, data_tracking, type, value)
      @css_class = css_class
      @data_tracking = data_tracking
      @type = type
      @value = value
    end

    private

    def name
      'button'
    end

    def data
      {
          class: @css_class,
          'data-tracking': @data_tracking,
          type: @type,
          value: @value
      }
    end
  end
end