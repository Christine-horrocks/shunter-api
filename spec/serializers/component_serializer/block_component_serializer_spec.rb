require_relative '../../rails_helper'

describe ComponentSerializer::BlockComponentSerializer do
  let ( :components ) { [{"atom1": 'atom1'}, {"atom2": 'atom2'}] }
  let ( :blockcomponentserializer ) { described_class.new(components) }
  context '#to_h' do
    it 'returns a hash containing the name and data' do
      expected = get_fixture('fixture')

      expect(blockcomponentserializer.to_yaml).to eq expected

    end
  end

end
