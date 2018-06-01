require_relative '../../rails_helper'

describe ComponentSerializer::ContainerComponentSerializer do
  let(:container_items) { [1, 2, 3] }

  let(:container_component_serializer) { described_class.new(container_items) }

  context '#to_h' do
    it 'returns a hash containing the name and data' do
      expected = get_fixture('fixture')

      expect(container_component_serializer.to_yaml).to eq expected
    end
  end
end
