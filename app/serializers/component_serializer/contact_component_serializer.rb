module ComponentSerializer
  class ContactComponentSerializer < BaseComponentSerializer

    def initialize(object)
      @object = object
    end

    def name
      name: "contact"
    end

    def data
      {
        "template": "contact",
        "contact-points": find_contact_points
      }
    end

    private

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