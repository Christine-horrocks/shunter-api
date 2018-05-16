module ComponentSerializer
  class RelatedLinksComponentSerializer < BaseComponentSerializer
    def initialize(person)
      @person = person
    end

    private

    def name
      "related-links"
    end

    def data
      {}.tap do |hash|
        hash["title"] = t('.people.related_links.title')
        hash["website"] = t('.people.related_links.website')
        hash["twitter"] = t('.people.related_links.twitter')
        hash["portrait"] = t('.people.related_links.portrait')
        hash["portrait-link"]= t('.people.related_links.portrait_link')
        hash["name"] = @person.full_name if @person.image_id
        hash["website-link"] = @person.personal_weblinks if @person.personal_weblinks.any?
        hash["twitter-link"] = @person.twitter_weblinks if @person.twitter_weblinks.any?
        hash["media-url"] = "/media/#{@person.image_id}" if @person.image_id
      end
    end
  end
end
