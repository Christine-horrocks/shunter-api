require_relative '../../rails_helper'

describe PageSerializer::PostcodesIndexPageSerializer, vcr: false do

  let(:serializer) { described_class.new }

  context '#to_h' do
    context 'creating correct hashes' do
      it 'for the postcodes index page' do
        expected = get_fixture('fixture')

        expect(serializer.to_yaml).to eq expected
      end

      it 'for the postcodes index page if there is a flash message' do
        serializer_with_flash_message = described_class.new('Invalid postcode')

        expected = get_fixture('flash_message')

        expect(serializer_with_flash_message.to_yaml).to eq expected
      end
    end

    context 'calling the correct serializers' do
      it 'for the postcodes index page' do
        allow(ComponentSerializer::SectionPrimaryComponentSerializer).to receive(:new)
        allow(ComponentSerializer::HeadingComponentSerializer).to receive(:new)
        allow(ComponentSerializer::FlashComponentSerializer).to receive(:new)
        allow(ComponentSerializer::FormComponentSerializer).to receive(:new)
        allow(ComponentSerializer::ParagraphComponentSerializer).to receive(:new)

        serializer.to_h

        expect(ComponentSerializer::SectionPrimaryComponentSerializer).to have_received(:new)
        expect(ComponentSerializer::HeadingComponentSerializer).to have_received(:new).with('Find your constituency', 1)
        expect(ComponentSerializer::FlashComponentSerializer).not_to have_received(:new)
        expect(ComponentSerializer::FormComponentSerializer).to have_received(:new).with('postcodeSearch', '/postcodes/lookup', 'post', 'input-group', serializer.form_components)
        expect(ComponentSerializer::ParagraphComponentSerializer).to have_received(:new).with(["Don't know your postcode? Find it on the <a href='http://www.royalmail.com/find-a-postcode'>Royal Mail postcode finder</a>."])
      end

      it 'calls all the input serializers' do
        allow(ComponentSerializer::InputComponentSerializer).to receive(:new)

        serializer.to_h

        expect(ComponentSerializer::InputComponentSerializer).to have_received(:new).with(type: 'hidden', name: 'previous_controller', id: 'previous_controller', value: 'postcodes')
        expect(ComponentSerializer::InputComponentSerializer).to have_received(:new).with(type: 'hidden', name: 'previous_action', id: 'previous_action', value: 'index')
        expect(ComponentSerializer::InputComponentSerializer).to have_received(:new).with(type: 'text', name: 'postcode', id: 'postcode', maxlength: '8', pattern: '[0-9a-zA-Z ]{5,}')
      end

      it 'for the postcodes index page if there is a flash message' do
        serializer_with_flash_message = described_class.new('Invalid postcode')

        allow(ComponentSerializer::FlashComponentSerializer).to receive(:new)

        serializer_with_flash_message.to_h

        expect(ComponentSerializer::FlashComponentSerializer).to have_received(:new).with('Invalid postcode')
      end
    end
  end
end
