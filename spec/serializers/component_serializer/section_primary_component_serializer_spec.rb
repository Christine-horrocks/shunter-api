require_relative '../../rails_helper'

describe ComponentSerializer::SectionPrimaryComponentSerializer do
  let ( :components ) { [1, 2] }
  let ( :section_primary_component_serializer ) { described_class.new(components) }

  context '#to_h' do
    it 'returns a hash containing the name and data' do
      expected = get_fixture('fixture')

      expect(section_primary_component_serializer.to_yaml).to eq expected
    end
  end
end