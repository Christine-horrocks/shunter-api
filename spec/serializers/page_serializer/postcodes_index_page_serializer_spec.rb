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

        serializer.to_h

        expect(ComponentSerializer::SectionPrimaryComponentSerializer).to have_received(:new)
        expect(ComponentSerializer::HeadingComponentSerializer).to have_received(:new).with('Find your constituency', 1)
        expect(ComponentSerializer::FlashComponentSerializer).not_to have_received(:new)
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
