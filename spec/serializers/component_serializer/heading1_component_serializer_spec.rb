require_relative '../../rails_helper'

describe ComponentSerializer::Heading1ComponentSerializer do
  let(:person) { double("person", full_name: "Dianne Abbott") }
  let(:heading1_component_serializer) { described_class.new(person) }

  context '#to_h' do
    it 'returns a hash containing the name and data' do
      expected = get_fixture('fixture')

      expect(heading1_component_serializer.to_yaml).to eq expected
    end
  end

end
