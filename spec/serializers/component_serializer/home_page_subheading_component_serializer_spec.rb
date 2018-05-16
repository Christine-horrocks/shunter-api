require_relative '../../rails_helper'

describe ComponentSerializer::HomePageSubheadingComponentSerializer do
  context '#to_h' do
    it 'returns a hash containing the name and data' do
      expected = get_fixture('fixture', __FILE__)

      expect(subject.to_yaml).to eq expected
    end
  end
end
