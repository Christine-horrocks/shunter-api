module ComponentSerializer
  class ConstituencyMPComponentSerializer <BaseComponentSerializer

    def initialize(member, constituency)
      @member = member
      @constituency =constituency
    end

    private

    def name
      "constituency-mp"
    end

    def data
      hash = {
        "display_name": "#{@member.display_name}",
        "graph_id": "#{@member.graph_id}",
        "image_url": get_image_url,
        "role": role,
        "party": party
      }
    end

    def get_image_url
        image_url = "https://s3-eu-west-1.amazonaws.com/web1live.pugin-website/1.7.6/images/placeholder_members_image.png"
        if @member.image_id != "placeholder"
          image_url = "https://api.parliament.uk/Live/photo/#{@member.image_id}.jpeg?crop=CU_1:1&amp;width=186&amp;quality=80"
        end
        image_url
      end

      def role
        role = "MP for #{@constituency.name}"
        role
      end

      def party
        @member.current_party_membership.party
      end

  end
end
