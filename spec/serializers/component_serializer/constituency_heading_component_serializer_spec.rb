require_relative '../../rails_helper'

describe ComponentSerializer::ConstituencyHeadingComponentSerializer do
  let (:constituency) { double('constituency', name: 'Blyth Vally') }
  let (:constituency_heading_component_serializer) { described_class.new(constituency) }

  context '#to_h' do
    it 'returns a hash containing the name and data' do
      expected = get_fixture('fixture')

      expect(constituency_heading_component_serializer.to_yaml).to eq expected
    end
  end
end
