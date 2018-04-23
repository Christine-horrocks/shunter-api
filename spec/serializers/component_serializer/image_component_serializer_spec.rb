require_relative '../../rails_helper'

describe ComponentSerializer::ImageComponentSerializer do
  let (:object) { double('object')}
  let (:imagecomponentserializer) { described_class.new(object) }
  context '#to_h' do
    it 'returns a hash containing the name and data for the image' do
      allow(object).to receive(:graph_id) {"43RHonMf"}
      allow(object).to receive(:image_id) {"43RHonMf"}
      allow(object).to receive(:display_name) {"Dianne Abbott"}
      expect(imagecomponentserializer.to_h).to eq({:name=>"image", :data=>{:template=>"person-image", :"figure-url"=>"/media/43RHonMf", :"image-srcset1"=>"https://api.parliament.uk/Staging/photo/43RHonMf.jpeg?crop=CU_5:2&width=732&quality=80, https://api.parliament.uk/Staging/photo/43RHonMf.jpeg?crop=CU_5:2&width=1464&quality=80 2x", :"image-srcset2"=>"https://api.parliament.uk/Staging/photo/43RHonMf.jpeg?crop=MCU_3:2&width=444&quality=80, https://api.parliament.uk/Staging/photo/43RHonMf.jpeg?crop=MCU_3:2&width=888&quality=80 2x", :"image-src"=>"https://api.parliament.uk/Staging/photo/43RHonMf.jpeg?crop=CU_1:1&width=186&quality=80", :"image-alt"=>"Dianne Abbott"}})
    end
  end
end
