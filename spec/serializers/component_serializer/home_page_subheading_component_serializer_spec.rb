require_relative '../../rails_helper'

describe ComponentSerializer::HomePageSubheadingComponentSerializer do
  context '#to_h' do
    it 'returns a hash containing the name and data' do
      expected = get_fixture('component_serializer/home_page_subheading_component_serializer/fixture.yml')

      expect(subject.to_yaml).to eq expected
    end
  end
end
