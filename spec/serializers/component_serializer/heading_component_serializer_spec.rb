require_relative '../../rails_helper'

describe ComponentSerializer::HeadingComponentSerializer do
  let(:heading) { "Dianne Abbott" }
  let(:weight) { 1 }
  let(:heading_component_serializer) { described_class.new(heading, weight) }

  context '#to_h' do
    it 'returns a hash containing the name and data' do
      expected = get_fixture('fixture')

      expect(heading_component_serializer.to_yaml).to eq expected
    end
  end
end