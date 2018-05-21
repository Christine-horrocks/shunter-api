require_relative '../../rails_helper'

describe ComponentSerializer::ParagraphComponentSerializer do
  let ( :text ) { ['text1', 'text2'] }
  let ( :paragraphcomponentserializer ) { described_class.new(text) }
  context '#to_h' do
    it 'returns a hash containing the name and data' do
      expected = get_fixture('fixture')

      expect(paragraphcomponentserializer.to_yaml).to eq expected

    end
  end

end
