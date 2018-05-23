require_relative '../../rails_helper'

describe ComponentSerializer::FlashComponentSerializer do
  let(:flash_component_serializer) { described_class.new('Flash message') }

  context '#to_h' do
    it 'returns a hash containing the name and data' do
      create_fixture(flash_component_serializer, 'fixture')
      expected = get_fixture('fixture')

      expect(flash_component_serializer.to_yaml).to eq expected
    end
  end
end