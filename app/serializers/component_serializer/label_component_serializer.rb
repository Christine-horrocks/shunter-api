module ComponentSerializer
  class LabelComponentSerializer < BaseComponentSerializer

    def initialize(for_parameter, text)
      @for_parameter = for_parameter
      @text = text
    end

    def name
      'label'
    end

    def data
      {
          for: @for_parameter,
          text: @text
      }
    end

  end
end