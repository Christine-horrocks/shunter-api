require_relative '../../rails_helper'

describe ComponentSerializer::ContentComponentSerializer do
  let(:heading) { 'Important things' }
  let(:additional_text) { 'Even more interesting information' }

  let (:content_component_serializer) { described_class.new(heading, additional_text) }

  context '#to_h' do
    it 'returns a hash containing the name and data' do
      expected = get_fixture('fixture', __FILE__)

      expect(content_component_serializer.to_yaml).to eq expected
    end
  end
end