require_relative '../../rails_helper'

describe ComponentSerializer::ListComponentSerializer do
  let(:heading) { '/mps' }
  let(:list_items) { [1, 2, 3] }

  let(:list_component_serializer) { described_class.new(heading, list_items) }

  context '#to_h' do
    it 'returns a hash containing the name and data' do
      expected = get_fixture('component_serializer/ListComponentSerializer/fixture.yml')

      expect(list_component_serializer.to_yaml).to eq expected
    end
  end
end
