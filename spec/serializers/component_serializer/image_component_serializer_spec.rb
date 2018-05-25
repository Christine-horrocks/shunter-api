require_relative '../../rails_helper'

describe ComponentSerializer::ImageComponentSerializer do
  let(:image_data) {
    { 'figure_url': 'figure_url',
      'image_srcset1': 'image_srcset1',
      'image_srcset2': 'image_srcset2',
      'image_src': 'image_src',
      'image_alt': 'image_alt'
    }
  }

  let(:image_component_serializer) { described_class.new(image_data) }

  context '#to_h' do
    it 'returns a hash containing the name and data for the image' do
      expected = get_fixture('fixture')

      expect(image_component_serializer.to_yaml).to eq expected
    end
  end
end
