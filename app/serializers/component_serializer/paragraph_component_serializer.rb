module ComponentSerializer
  # Creates a hash where the data content is an array of strings which Dust will render into lines of text.
  class ParagraphComponentSerializer < BaseComponentSerializer
    # Initialise a paragraph component with one or more pieces of content.
    #
    # @param [Array<String>]  an array of one or more pieces of content to be wrapped in <p> tags.
    # @example ['Line one content', 'Line two content']
    def initialize(content)
      @content = content
    end

    def name
      "paragraph"
    end

    def data
      {
        "content": @content
      }
    end

  end
end
