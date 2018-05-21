require_relative '../../rails_helper'

describe ComponentSerializer::ImageComponentSerializer do
  let(:figure_url) { 'image.com' }
  let(:image_srcset1) { 'imageimage' }
  let(:image_srcset2) { 'picturepicture' }
  let(:image_src) { 'srcsrc' }
  let(:image_alt) { 'alt' }
  let(:image_component_serializer) { described_class.new(figure_url, image_srcset1, image_srcset2, image_src, image_alt) }

  context '#to_h' do
    it 'returns a hash containing the name and data for the image' do
      expected = get_fixture('fixture')

      expect(image_component_serializer.to_yaml).to eq expected
    end
  end
end
