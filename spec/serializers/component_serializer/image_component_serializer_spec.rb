require_relative '../../rails_helper'

describe ComponentSerializer::ImageComponentSerializer do
  let(:object) { double('object', graph_id: '43RHonMf', image_id: '43RHonMf', display_name: 'Dianne Abbott')}
  let(:image_component_serializer) { described_class.new(object) }

  context '#to_h' do
    it 'returns a hash containing the name and data for the image' do
      expected = get_fixture('fixture')

      expect(image_component_serializer.to_yaml).to eq expected
    end
  end
end
