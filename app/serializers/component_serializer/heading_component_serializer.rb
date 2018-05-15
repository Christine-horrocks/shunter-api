module ComponentSerializer
  class HeadingComponentSerializer < BaseComponentSerializer

    # Initialise a paragraph component with a piece of text and an integer.
    #
    # @param [String] a string of text to be wrapped in <h> tags.
    # @param [Integer] a number from 1 - 4 to be placed in the <h> tag.

    def initialize(heading, weight)
      @heading = heading
      @weight = weight
    end

    private

    def name
      "heading"
    end

    def data
      {
        "heading": @heading,
        "weight": @weight
      }
    end

  end
end
