module PageSerializer
  class PersonShowPageSerializer < PageSerializer::BasePageSerializer

    def initialize(person, seat_incumbencies=[], committee_memberships=[], government_incumbencies=[], opposition_incumbencies=[])
      @person = person
      @seat_incumbencies = seat_incumbencies
      @committee_memberships = committee_memberships
      @government_incumbencies = government_incumbencies
      @opposition_incumbencies = opposition_incumbencies
      @role_helper = RoleHelper
    end

    def content
      c = []
      c << ComponentSerializer::SectionPrimaryComponentSerializer.new(section_primary_components).to_h
      c << ComponentSerializer::WhenToContactComponentSerializer.new.to_h if @person.current_mp?
      c << ComponentSerializer::BlockComponentSerializer.new(contact_components).to_h if @person.current_mp? || @person.current_lord?
      c << ComponentSerializer::HeadingComponentSerializer.new(t('.people.roles.roles').capitalize, size: 2).to_h if @person.incumbencies.any? || @committee_memberships.any?
      c << ComponentSerializer::ListComponentSerializer.new(current_roles_list_items).to_h if @person.incumbencies.any? || @committee_memberships.any?
      c << ComponentSerializer::BlockComponentSerializer.new(related_links_components, 'block--border__bottom').to_h
      c
    end

    def title
      "#{@person.display_name} #{t('.uk_parliament')}"
    end

    def section_primary_components
      c = []
      c << ComponentSerializer::HeadingComponentSerializer.new(@person.full_name, size: 1).to_h
      c << ComponentSerializer::ParagraphComponentSerializer.new(mp_constituency_information).to_h
      c << ComponentSerializer::ImageComponentSerializer.new(image_data).to_h if @person.image_id && @person.image_id != 'placeholder'
      c
    end

    def mp_constituency_information
      text = []
      information = t('.former_mp') if @person.former_mp?
      information = t('.former_lord') if @person.former_lord?
      information = "#{@person.current_party_membership.try(&:party).try(&:name)} #{t('.people.show.mp_for')} #{@person.current_seat_incumbency.constituency.name}" if @person.current_mp?
      information = "#{@person.current_party_membership.try(&:party).try(&:name)} - #{@person.statuses[:house_membership_status].join( t('.and') )}" if @person.current_lord?
      text << information
      text
    end

    def image_data
     {
       figure_url: "/media/#{@person.graph_id}",
       image_srcset1: generate_srcset(@person.image_id, 'CU_5:2', 732, 1464),
       image_srcset2: generate_srcset(@person.image_id, 'MCU_3:2', 444, 888),
       image_src: generate_image_src(@person.image_id, 'CU_1:1', '186'),
       image_alt: "#{@person.display_name}"
     }
    end

    def generate_srcset(id, crop, small_width, large_width)
      small_src = generate_image_src(id, crop, small_width)
      large_src = generate_image_src(id, crop, large_width)

      "#{small_src}, #{large_src} 2x"
    end

    def generate_image_src(id, crop, width)
      "#{ENV['IMAGE_SERVICE_URL']}/#{id}.jpeg?crop=#{crop}&width=#{width}&quality=80"
    end

   def current_roles
     history = @role_helper.create_role_history(@seat_incumbencies, @committee_memberships, @government_incumbencies, @opposition_incumbencies)
     @role_helper.organise_roles(history[:current]) if history[:current]
   end

   def current_roles_list_items
     current_roles.map do |role_hash|
       {
         "name": 'role-card',
         "data": role_hash
       }
     end
   end

   def related_links_components
     c = []
     c << ComponentSerializer::HeadingComponentSerializer.new(t('.people.related_links.title'), size: 2).to_h if @person.weblinks? || (@person.image_id && @person.image_id != 'placeholder')
     c << ComponentSerializer::DescriptionListComponentSerializer.new(related_links).to_h if @person.weblinks?
     c << ComponentSerializer::ParagraphComponentSerializer.new(image_download_link).to_h if @person.image_id && @person.image_id != 'placeholder'
     c
   end

   def related_links
     weblinks = @person.personal_weblinks.map { |weblink| link_to(weblink.to_s, weblink) }
     twitter_weblinks = @person.twitter_weblinks.map { |weblink| link_to(weblink.to_s, weblink) }
     facebook_weblinks = @person.facebook_weblinks.map { |weblink| link_to(weblink.to_s, weblink) }

     links = []
     links << { "medium-name": t('.people.related_links.website'), "medium-link": weblinks } if @person.personal_weblinks.any?
     links << { "medium-name": t('.people.related_links.twitter'), "medium-link": twitter_weblinks } if @person.twitter_weblinks.any?
     links << { "medium-name": t('.people.related_links.facebook'), "medium-link": facebook_weblinks } if @person.facebook_weblinks.any?
     links
   end

   def image_download_link
     text = []
     text << [@person.full_name + t('.people.related_links.portrait', link: link_to(t('.people.related_links.portrait_link'), '/media/#{@person.image_id}'))] if @person.image_id
     text
   end

   def contact_components
     c = []
     c << ComponentSerializer::HeadingComponentSerializer.new(t('.contact_points.contact_caps'), size: 2).to_h
     c << ComponentSerializer::DescriptionListComponentSerializer.new(contact_links).to_h if @person.current_seat_incumbency.contact_points != []
     c
   end

   def contact_links
     contact_points = []
    @person.try(&:current_seat_incumbency).try(&:contact_points).each do |contact_point|
      contact_points <<
         {
           "email": contact_point.email,
           "phone": contact_point.phone_number,
           "addresses": contact_point.postal_addresses.map(&:full_address)
         }
      end
     links = []
     links << { "medium-name": t('.contact_points.email_caps'), "medium-link": [contact_points.first[:email]] } if contact_points != [] && contact_points.first[:email] != nil
     links << { "medium-name": t('contact_points.phone_caps'), "medium-link": [contact_points.first[:phone]] } if contact_points != [] && contact_points.first[:phone] != nil
     links << { "medium-name": t('contact_points.address_caps'), "medium-link": contact_points.first[:addresses] } if contact_points != [] && contact_points.first[:addresses].first != nil
     links
    end

  end
end
