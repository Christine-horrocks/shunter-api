require_relative '../../rails_helper'

describe ComponentSerializer::StatusHighlightComponentSerializer do
  let(:content) { 'Things' }
  let(:status_highlight_component_serializer) { described_class.new(content) }

  context '#to_h' do
    it 'returns a hash containing the name and data' do
      expected = get_fixture('fixture', __FILE__)

      expect(status_highlight_component_serializer.to_yaml).to eq expected
    end
  end
end
