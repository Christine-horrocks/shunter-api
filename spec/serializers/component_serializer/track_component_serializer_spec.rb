require_relative '../../rails_helper'

describe ComponentSerializer::TrackComponentSerializer do
  let(:track_items) { [1, 2, 3] }

  let(:track_component_serializer) { described_class.new(track_items) }

  context '#to_h' do
    it 'returns a hash containing the name and data' do
      expected = get_fixture('fixture')

      expect(track_component_serializer.to_yaml).to eq expected
    end
  end
end
