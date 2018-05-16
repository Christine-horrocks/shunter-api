module ComponentSerializer
  class PersonComponentSerializer < BaseComponentSerializer
    def initialize(person, options = {})
      @person = person
      @options = options
    end

    private

    def content
      hash = {
        "display_name": "#{@person.display_name}",
        "graph_id": "#{@person.graph_id}",
        "image_url": get_image_url,
        "role": role
      }
      hash.tap do |hash|
        hash["current_party"] = current_party if current_party
      end
      hash
    end

    def get_image_url
        image_url = "https://s3-eu-west-1.amazonaws.com/web1live.pugin-website/1.7.6/images/placeholder_members_image.png"
        if @person.image_id != "placeholder"
          image_url = "https://api.parliament.uk/Live/photo/#{@person.image_id}.jpeg?crop=CU_1:1&amp;width=186&amp;quality=80"
        end
        image_url
      end

      def role
        role = "#{t('.people.show.mp_for')} #{@options[:constituency_name]}" if @options[:constituency_show_page]
        role = t('former_mp') if @person.former_mp?
        role = t('.former_lord') if @person.former_lord?
        role = "#{t('.people.show.mp_for')} #{@person.current_seat_incumbency.constituency.name}" if @person.current_mp?
        role = "#{@person.statuses[:house_membership_status].join(t('.and'))}" if @person.current_lord?
        role
      end

      def current_party
        current_party = nil if @person.former_mp? || @person.former_lord?
        current_party = @person.current_party_membership.try(&:party).try(&:name) if @person.current_mp? || @person.current_lord? || @options[:constituency_show_page]
        current_party
      end
  end
end
