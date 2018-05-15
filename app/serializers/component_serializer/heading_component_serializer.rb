module ComponentSerializer
  class HeadingComponentSerializer < BaseComponentSerializer

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
