module ComponentSerializer
  class ListItemComponentSerializer < BaseComponentSerializer
    def initialize(link, link_text, *additional_text)
      @link = link
      @link_text = link_text
      @additional_text = *additional_text
    end

    def to_h
          {
            "link": @link,
            "link-text": @link_text,
            "additional-text": @additional_text
          }
    end
  end
end
