require_relative '../../rails_helper'

describe ComponentSerializer::RelatedLinksComponentSerializer do
  let (:person) { double('person')}
  let (:relatedlinkscomponentserializer) { described_class.new(person) }
  context '#to_h' do

    it 'returns a hash with the all data if image_id, personal_weblinks, twitter_weblinksand image_idare present' do
      allow(person).to receive(:full_name) {"Dianne Abbott"}
      allow(person).to receive(:image_id) {"43RHonMf"}
      allow(person).to receive(:personal_weblinks) {["DianneAbbott.com"]}
      allow(person).to receive(:twitter_weblinks) {["DianneAbbottonTwitter.com"]}
      expect(relatedlinkscomponentserializer.to_h).to eq({:name=>"related-links", :data=>{"template"=>"related-links", "name"=>"Dianne Abbott", "website"=>["DianneAbbott.com"], "twitter"=>["DianneAbbottonTwitter.com"], "media-url"=>"/media/43RHonMf"}})
    end

    it 'returns a hash without the name or media-url if no image_id is present' do
      allow(person).to receive(:full_name) {"Dianne Abbott"}
      allow(person).to receive(:image_id) {nil}
      allow(person).to receive(:personal_weblinks) {["DianneAbbott.com"]}
      allow(person).to receive(:twitter_weblinks) {["DianneAbbottonTwitter.com"]}
      expect(relatedlinkscomponentserializer.to_h).to eq({:name=>"related-links", :data=>{"template"=>"related-links", "website"=>["DianneAbbott.com"], "twitter"=>["DianneAbbottonTwitter.com"]}})
    end

    it 'returns a hash without the personal_weblinks if they are not present' do
      allow(person).to receive(:full_name) {"Dianne Abbott"}
      allow(person).to receive(:image_id) {"43RHonMf"}
      allow(person).to receive(:personal_weblinks) {[]}
      allow(person).to receive(:twitter_weblinks) {["DianneAbbottonTwitter.com"]}
      expect(relatedlinkscomponentserializer.to_h).to eq({:name=>"related-links", :data=>{"template"=>"related-links", "name"=>"Dianne Abbott", "twitter"=>["DianneAbbottonTwitter.com"], "media-url"=>"/media/43RHonMf"}})
    end

    it 'returns a hash without the twitter_weblinks if they are not present' do
      allow(person).to receive(:full_name) {"Dianne Abbott"}
      allow(person).to receive(:image_id) {"43RHonMf"}
      allow(person).to receive(:personal_weblinks) {["DianneAbbott.com"]}
      allow(person).to receive(:twitter_weblinks) {[]}
      expect(relatedlinkscomponentserializer.to_h).to eq({:name=>"related-links", :data=>{"template"=>"related-links", "name"=>"Dianne Abbott", "website"=>["DianneAbbott.com"], "media-url"=>"/media/43RHonMf"}})
    end

  end
end
