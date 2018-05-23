module ComponentSerializer
  # Creates a hash conating the content for a heading and an integer to set the heading size.
  class HeadingComponentSerializer < BaseComponentSerializer
    # Initialise a paragraph component with a piece of text and an integer.
    #
    # @param [String] a string of text to be wrapped in <h> tags.
    # @param [Integer] a number from 1 - 4 to be placed in the <h> tag.
    def initialize(heading, size:)
      @heading = heading
      @size = size
    end

    private

    def name
      "heading"
    end

    def data
      {
        "heading": @heading,
        "size": @size
      }
    end

  end
end
