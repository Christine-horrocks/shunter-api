require_relative '../../rails_helper'

describe ComponentSerializer::CardComponentSerializer do
  let(:components) { [{ atom1: 'atom1' }, { atom2: 'atom2' }] }
  let(:card_component_serializer) { described_class.new(components) }

  context '#to_h' do
    it 'returns a hash containing the name and data' do
      expected = get_fixture('fixture')

      expect(card_component_serializer.to_yaml).to eq expected
    end
  end
end