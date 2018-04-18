module Serializers
  class PersonShowPage < Page

        def initialize(person, seat_incumbencies=[], committee_memberships=[], government_incumbencies=[], opposition_incumbencies=[])
          @person = person
          @seat_incumbencies = seat_incumbencies
          @committee_memberships = committee_memberships
          @government_incumbencies = government_incumbencies
          @opposition_incumbencies = opposition_incumbencies
        end

        def content
          [
                # {
                #   name:  "heading1",
                #   data: "#{@person.full_name}"
                # },
                (Serializers::Heading1.new(@person).to_h),
                # {
                #   name: "subheading",
                #   data: subheading
                # },
                 (Serializers::Subheading.new(@person).to_h),
                 (Serializers::Image.new(@person).to_h if @person.image_id && @person.image_id != 'placeholder'),
                 (Serializers::WhenToContact.new.to_h),
                 (Serializers::Contact.new(@person).to_h if @person.contact_points.any?),
                 (Serializers::Roles.new(@seat_incumbencies, @committee_memberships, @government_incumbencies, @opposition_incumbencies).to_h if @person.incumbencies.any? || @committee_memberships.any?),
                 (Serializers::Timeline.new(@seat_incumbencies, @committee_memberships, @government_incumbencies, @opposition_incumbencies).to_h if @person.incumbencies.any? || @committee_memberships.any?),
                 (Serializers::RelatedLinks.new(@person).to_h if @person.weblinks? || (@person.image_id && @person.image_id != 'placeholder'))
             ]
        end

      def title
        "#{@person.display_name} UK Parliament"
      end

  end
end
