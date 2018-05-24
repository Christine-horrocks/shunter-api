module PageSerializer
  # Initialises all the components that are required for the Postcodes index page.
  class PostcodesIndexPageSerializer < PageSerializer::BasePageSerializer
    # @param [Hash] params contains the parameters for the page.
    # @param [String] flash message that is optionally passed in that is shown on the page for one request.
    def initialize(params, flash = nil)
      @params = params
      @flash = flash
    end

    private

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

      form_components << ComponentSerializer::InputComponentSerializer.new(type: 'hidden', name: 'previous_controller', id: 'previous_controller', value: @params[:controller]).to_h
      form_components << ComponentSerializer::InputComponentSerializer.new(type: 'hidden', name: 'previous_action', id: 'previous_action', value: @params[:action]).to_h
      form_components << ComponentSerializer::InputComponentSerializer.new(type: 'text', name: 'postcode', id: 'postcode', maxlength: '8', pattern: '[0-9a-zA-Z ]{5,}', label_text: 'Enter your full postcode, for example SW1A 0AA.').to_h

      form_components << ComponentSerializer::ButtonComponentSerializer.new('btn--primary', 'postcode', 'submit', 'Find').to_h

      form_components.flatten
    end

    def title
      'Find your constituency'
    end

  end
end