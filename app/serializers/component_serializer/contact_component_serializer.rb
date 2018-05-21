module ComponentSerializer
  class ContactComponentSerializer < BaseComponentSerializer

    def initialize(object)
      @object = object
    end

    private

    def name
      "contact"
    end

    def data
      {
        "title": t('.contact_points.contact_caps'),
        "email": t('.contact_points.email_caps'),
        "phone": t('contact_points.phone_caps'),
        "address": t('contact_points.address_caps'),
        "contact-points": find_contact_points
      }
    end

    def find_contact_points
      @object.try(&:current_seat_incumbency).try(&:contact_points).map do |contact_point|
        {
          "email": contact_point.email,
          "phone": contact_point.phone_number,
          "addresses": contact_point.postal_addresses.map(&:full_address)
        }
      end
    end
  end
end
