require_relative '../../rails_helper'

describe ComponentSerializer::ImageComponentSerializer do
  let(:figure_url) { 'image.com' }
  let(:image_srcset1) { 'imageimage' }
  let(:image_srcset2) { 'picturepicture' }
  let(:image_src) { 'srcsrc' }
  let(:image_alt) { 'alt' }
  let(:image_component_serializer) { described_class.new({ figure_url: 'data', image_srcset1: 'data', image_srcset2: 'data', image_src: 'data', image_alt: 'data'}) }

  context '#to_h' do
    it 'returns a hash containing the name and data for the image' do
      create_fixture(image_component_serializer, 'fixture')
      expected = get_fixture('fixture')

      expect(image_component_serializer.to_yaml).to eq expected
    end
  end
end
