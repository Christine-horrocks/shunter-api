module PageSerializer
  class PostcodesIndexPageSerializer < PageSerializer::BasePageSerializer
    def initialize(flash = nil)
      @flash = flash
    end

    def content
      content = []

      content << ComponentSerializer::SectionPrimaryComponentSerializer.new(sub_components).to_h

      content
    end

    def sub_components
      sub_components = []

      sub_components << ComponentSerializer::HeadingComponentSerializer.new('Find your constituency', 1).to_h

      sub_components << ComponentSerializer::FlashComponentSerializer.new(@flash).to_h if @flash

      sub_components << [
          {
              "name": "form",
              "data": {
                  "id": "postcodeSearch",
                  "action": "/postcodes/lookup",
                  "method": "post",
                  "inner-div-class": "input-group",
                  "components": [
                      {
                          "name": "input",
                          "data": {
                              "type": "hidden",
                              "name": "previous_controller",
                              "id": "previous_controller",
                              "value": "postcodes"
                          }
                      },
                      {
                          "name": "input",
                          "data": {
                              "type": "hidden",
                              "name": "previous_action",
                              "id": "previous_action",
                              "value": "index"
                          }
                      },
                      {
                          "name": "label",
                          "data": {
                              "for": "postcode",
                              "text": "Enter your full postcode, for example SW1A 0AA."
                          }
                      },
                      {
                          "name": "input",
                          "data": {
                              "type": "text",
                              "name": "postcode",
                              "id": "postcode",
                              "maxlength": "8",
                              "pattern": "[0-9a-zA-Z ]{5,}"
                          }
                      },
                      {
                          "name": "button",
                          "data": {
                              "class": "btn--primary",
                              "data-tracking": "postcode",
                              "type": "submit",
                              "value": "Find"
                          }
                      }
                  ]
              }
          },
          {
              "name": "paragraph",
              "data": {
                  "text": [
                      "Don't know your postcode? Find it on the <a href='http://www.royalmail.com/find-a-postcode'>Royal Mail postcode finder</a>."
                  ]
              }
          }
      ]

      sub_components.flatten
    end

    def title
      'Find your constituency'
    end
  end
end