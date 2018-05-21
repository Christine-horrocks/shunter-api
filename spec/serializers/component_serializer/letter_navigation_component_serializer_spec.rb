require_relative '../../rails_helper'

describe ComponentSerializer::LetterNavigationComponentSerializer do
  let(:letter_navigation_component_serializer) { described_class.new(%w(A C), 'C') }

  context '#to_h' do
    it 'returns a hash containing the name and data for the letter navigation bar' do
      expected = get_fixture('fixture')

      expect(letter_navigation_component_serializer.to_yaml).to eq expected
    end
  end
end
