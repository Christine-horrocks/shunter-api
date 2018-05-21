module ComponentSerializer
  class WhenToContactComponentSerializer < BaseComponentSerializer
    def name
       "when-to-contact"
    end

    def data
      {
        "title": t('.people.when_to_contact.title'),
        "mps-can-help-with": t('.people.when_to_contact.mps_can_help_with'),
        "list": [
          t('.people.when_to_contact.hospitals_nhs'),
          t('.people.when_to_contact.problems'),
          t('.people.when_to_contact.immigration'),
          t('.people.when_to_contact.school_closures'),
          t('.people.when_to_contact.transport')
        ],
        "who-else-can-help": t('.people.when_to_contact.who_else_can_help'),
        "link": '/who-should-i-contact-with-my-issue',
        "discuss-with": t('.people.when_to_contact.discuss_with'),
        "contact-postcode": t('.people.when_to_contact.contact_postcode')
      }
    end
  end
end
