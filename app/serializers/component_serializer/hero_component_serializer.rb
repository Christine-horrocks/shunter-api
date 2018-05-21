module ComponentSerializer
  class HeroComponentSerializer < BaseComponentSerializer
    def initialize(title, *additional_text)
      @title = title
      @additional_text = *additional_text
    end

    def name
      "hero"
    end

    def data
      {
        "title": @title,
        "additional-text": @additional_text
      }
    end
  end
end
