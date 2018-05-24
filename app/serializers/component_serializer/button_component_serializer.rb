module ComponentSerializer
  class ButtonComponentSerializer < BaseComponentSerializer

    def initialize(css_class, data_tracking, type, value)
      @css_class = css_class
      @data_tracking = data_tracking
      @type = type
      @value = value
    end

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