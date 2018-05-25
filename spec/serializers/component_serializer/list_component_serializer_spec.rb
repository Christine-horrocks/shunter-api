require_relative '../../rails_helper'

describe ComponentSerializer::ListComponentSerializer do
  let(:list_items) { [1, 2, 3] }

  let(:list_component_serializer) { described_class.new(list_items) }

  context '#to_h' do
    it 'returns a hash containing the name and data' do
      expected = get_fixture('fixture')

      expect(list_component_serializer.to_yaml).to eq expected
    end
  end
end