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
      contact_points = []
      @object.try(&:current_seat_incumbency).try(&:contact_points).each do |contact_point|
        contact_points << {
          "email": contact_point.email,
          "phone": contact_point.phone_number,
          "addresses": contact_point.postal_addresses.map(&:full_address)
        }
      end
      contact_points
    end
  end
end
