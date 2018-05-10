module ComponentSerializer
  class ContentComponentSerializer <BaseComponentSerializer

    def initialize(heading, *additional_text)
      @heading = heading
      @additional_text = *additional_text
    end

    def to_h
      {
        "name": 'content',
        "data":
        {
          "heading": @heading,
          "additional-text": @additional_text
        }
      }
    end


  end
end
