module ComponentSerializer
  class StatusHighlightComponentSerializer < BaseComponentSerializer
    def initialize(content)
      @content = content
    end

    def name
      "highlight-component"
    end

    def data
      {
        "content": @content
      }
    end
  end
end
