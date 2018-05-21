require_relative '../../rails_helper'

describe ComponentSerializer::DescriptionListComponentSerializer do
  let ( :data ) { [{ "key1": 'value1', "key2": 'value2' }, { "key1": 'value1', "key2": 'value2' }] }
  let ( :descriptionlistcomponentserializer ) { described_class.new(data) }
  context '#to_h' do
    it 'returns a hash containing the name and data' do
      expected = get_fixture('fixture')

      expect(descriptionlistcomponentserializer.to_yaml).to eq expected

    end
  end

end
