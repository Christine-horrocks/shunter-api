require_relative '../../rails_helper'

describe PageSerializer::PostcodesShowPageSerializer, vcr: false do

  let(:current_party) { double('current_party', name: 'Labour') }
  let(:person_constituency) { double('person_constituency', name: 'Leith') }
  let(:current_seat_incumbency) { double('current_seat_incumbency', constituency: constituency) }
  let(:person) {
    double(
        'person',
        graph_id: 321,
        display_name: 'Display Name',
        current_seat_incumbency: current_seat_incumbency,
        current_party: current_party,
        image_id: 'image_id'
    )
  }
  let(:postcode) { 'eh6 5ez' }
  let(:constituency) { double('constituency', graph_id: 123, name: 'Constituency') }
  let(:serializer) { described_class.new(constituency, postcode, person) }

  context '#to_h' do
    context 'creating correct hashes' do
      it 'for the postcodes show page' do
        expected = get_fixture('fixture')

        expect(serializer.to_yaml).to eq expected
      end

      it 'person has image_id that is placeholder' do
        allow(person).to receive(:image_id) { 'placeholder' }

        expected = get_fixture('placeholder_image_id')

        expect(serializer.to_yaml).to eq expected
      end
    end

    context 'calling the correct serializers' do
      it '#sub_components' do
        allow(serializer).to receive(:card_components) { 'card_components' }

        allow(ComponentSerializer::HeadingComponentSerializer).to receive(:new)
        allow(ComponentSerializer::BlockComponentSerializer).to receive(:new)
        allow(ComponentSerializer::ListComponentSerializer).to receive(:new)
        allow(ComponentSerializer::ParagraphComponentSerializer).to receive(:new)

        serializer.to_h

        expect(ComponentSerializer::HeadingComponentSerializer).to have_received(:new).with(
          '<span>Results for EH6 5EZ</span>', 1
        )

        expect(ComponentSerializer::BlockComponentSerializer).to have_received(:new).with(
          [ComponentSerializer::HeadingComponentSerializer.new("<a href='/constituencies/123'>Constituency</a>", 2).to_h]
        )

        expect(ComponentSerializer::ListComponentSerializer).to have_received(:new).with(
          [ComponentSerializer::CardComponentSerializer.new('card_components').to_h],
          '--block'
        )

        expect(ComponentSerializer::ParagraphComponentSerializer).to have_received(:new).with(
          ["<a href='/postcodes'>Check for a different postcode</a>"]
        )
      end

      it '#card_components' do
        allow(serializer).to receive(:image_data) { 'image_data' }
        allow(serializer).to receive(:card_details_components) { 'card_details_components' }

        allow(ComponentSerializer::ImageComponentSerializer).to receive(:new)
        allow(ComponentSerializer::CardDetailsComponentSerializer).to receive(:new)

        serializer.to_h

        expect(ComponentSerializer::ImageComponentSerializer).to have_received(:new).with('image_data')
        expect(ComponentSerializer::CardDetailsComponentSerializer).to have_received(:new).with('card_details_components')
      end

      it '#card_details_components' do
        allow(ComponentSerializer::HeadingComponentSerializer).to receive(:new)
        allow(ComponentSerializer::ParagraphComponentSerializer).to receive(:new)

        serializer.to_h

        expect(ComponentSerializer::HeadingComponentSerializer).to have_received(:new).with(
            "<a href='/people/321'>Display Name</a>", 2
        )

        expect(ComponentSerializer::ParagraphComponentSerializer).to have_received(:new).with(
            [
                'MP for Constituency',
                'Labour'
            ]
        )
      end
    end
  end
end
