require_relative '../../rails_helper'

describe ComponentSerializer::LetterNavigationComponentSerializer do
  let(:letter_navigation_component_serializer) { described_class.new(["A","C"], "C") }

  context '#to_h' do
    it 'returns a hash containing the name and data for the letter navigation bar' do
      expected = get_fixture('component_serializer/letter_navigation_component_serializer/fixture.yml')

      expect(letter_navigation_component_serializer.to_yaml).to eq expected
    end
  end
end
