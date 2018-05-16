require_relative '../../rails_helper'

describe ComponentSerializer::ListItemComponentSerializer do
  let(:link) { '/mps' }
  let(:link_text) { 'find MPs here' }
  let(:additional_text) { 'Even more MPs' }

  let(:list_item_component_serializer) { described_class.new(link, link_text, additional_text) }

  context '#to_h' do
    it 'returns a hash containing the name and data' do
      expected = get_fixture('component_serializer/list_item_component_serializer/fixture.yml')

      expect(list_item_component_serializer.to_yaml).to eq expected
    end
  end
end
