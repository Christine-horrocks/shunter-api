module ComponentSerializer
  class ParagraphComponentSerializer < BaseComponentSerializer

    # Initialise a paragraph component with one or more pieces of content.
    #
    # @param [Array<String>] text an array of one or more pieces of content to be wrapped in <p> tags.
    def initialize(text)
      @text = text
    end

    def name
      "paragraph"
    end

    def data
      {
        "text": @text
      }
    end

  end
end
