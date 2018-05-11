require_relative '../../rails_helper'

describe PageSerializer::HomePageSerializer, vcr: false do
  context '#to_h' do
    it 'returns a hash with the home page components' do
      expected_hash = get_fixture('page_serializer/home_page_serializer/hash.yml')

      expect(subject.to_h.to_yaml).to eq expected_hash
    end

    it 'calls the correct component serializers' do
      allow(ComponentSerializer::HeroComponentSerializer).to receive(:new)
      allow(ComponentSerializer::HomePageSubheadingComponentSerializer).to receive(:new)
      allow(ComponentSerializer::ListItemComponentSerializer).to receive(:new)
      allow(ComponentSerializer::ListComponentSerializer).to receive(:new)
      allow(ComponentSerializer::StatusHighlightComponentSerializer).to receive(:new)
      allow(ComponentSerializer::ContentComponentSerializer).to receive(:new)
      subject.to_h
      expect(ComponentSerializer::HeroComponentSerializer).to have_received(:new)
      expect(ComponentSerializer::HomePageSubheadingComponentSerializer).to have_received(:new)
      expect(ComponentSerializer::ListItemComponentSerializer).to have_received(:new).exactly(6).times
      expect(ComponentSerializer::ListComponentSerializer).to have_received(:new).exactly(3).times
      expect(ComponentSerializer::StatusHighlightComponentSerializer).to have_received(:new).exactly(3).times
      expect(ComponentSerializer::ContentComponentSerializer).to have_received(:new).exactly(2).times
    end
  end
end
