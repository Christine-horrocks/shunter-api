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
      sub_components << ComponentSerializer::FormComponentSerializer.new('postcodeSearch', '/postcodes/lookup', 'post', 'input-group', form_components).to_h
      sub_components << ComponentSerializer::ParagraphComponentSerializer.new(["Don't know your postcode? Find it on the <a href='http://www.royalmail.com/find-a-postcode'>Royal Mail postcode finder</a>."]).to_h

      sub_components.flatten
    end

    def form_components
      form_components = []

      form_components << ComponentSerializer::InputComponentSerializer.new(type: 'hidden', name: 'previous_controller', id: 'previous_controller', value: 'postcodes').to_h
      form_components << ComponentSerializer::InputComponentSerializer.new(type: 'hidden', name: 'previous_action', id: 'previous_action', value: 'index').to_h

      form_components << {
          "name": "label",
          "data": {
              "for": "postcode",
              "text": "Enter your full postcode, for example SW1A 0AA."
          }
      }

      form_components << ComponentSerializer::InputComponentSerializer.new(type: 'text', name: 'postcode', id: 'postcode', maxlength: '8', pattern: '[0-9a-zA-Z ]{5,}').to_h

      form_components << {
          "name": "button",
          "data": {
              "class": "btn--primary",
              "data-tracking": "postcode",
              "type": "submit",
              "value": "Find"
          }
      }

      form_components
    end

    def title
      'Find your constituency'
    end
  end
end