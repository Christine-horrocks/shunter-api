require_relative '../../rails_helper'
require_relative '../../../app/serializers/base_serializer'

describe PageSerializer::HomePageSerializer, vcr: false do
  context '#to_h' do
    it 'returns a hash with the home page components' do
      expected_hash = {:layout=>{:template=>"layout"}, :title=>"beta.parliament.uk", :components=>[{:name=>"cookie-banner", :data=>"cookie-banner"}, {:name=>"banner", :data=>"banner"}, {:name=>"header", :data=>"header"}, {:name=>"hero", :data=>{:title=>"Welcome to the UK Parliament test website", :"additional-text"=>["We’re building a <a href=\"https://pds.blog.parliament.uk/2017/02/14/a-new-website-for-parliament-first-public-steps/\">new website for Parliament</a>. These pages are being tested and improved – They may not work for everyone.", "Test pages are separate from the current <a href=\"https://www.parliament.uk\">parliament.uk</a> website."]}}, {:name=>"home-page-subheading", :data=>{:subheading=>"What's on beta.parliament.uk"}}, {:name=>"list-component", :data=>{:heading=>"Object to a bill", :"list-items"=>[{:link=>"/petition-a-hybrid-bill/2", :"link-text"=>"Object to the Additional Provision to the High Speed Rail (West Midlands to Crew) Bill", :"additional-text"=>["The deadline is 1pm on Friday 27th April 2018"]}]}}, {:name=>"highlight-component", :data=>{:content=>"Read the <a href=\"https://pds.blog.parliament.uk/2018/02/09/building-a-new-online-service-petitioning-a-hybrid-bill/\">Object to a bill blog post</a>."}}, {:name=>"list-component", :data=>{:heading=>"Search", :"list-items"=>[{:link=>"/search", :"link-text"=>"Search", :"additional-text"=>["Find results from current parliament.uk websites."]}]}}, {:name=>"highlight-component", :data=>{:content=>"Read the <a href=\"https://pds.blog.parliament.uk/2017/09/06/launching-the-new-search-service-on-parliament-uk/\">Search blog post</a>."}}, {:name=>"list-component", :data=>{:heading=>"MPs and Lords information", :"list-items"=>[{:link=>"/mps", :"link-text"=>"MPs", :"additional-text"=>["View all current members of the House of Commons."]}, {:link=>"/lords", :"link-text"=>"MPs", :"additional-text"=>["View all current members of the House of Commons."]}, {:link=>"/constituencies", :"link-text"=>"Constituencies", :"additional-text"=>["Find current MPs by the area they represent."]}, {:link=>"/houses/1AFu55Hs/parties/current", :"link-text"=>"Parties and Groups", :"additional-text"=>["Find current MPs and Lords by their party or group."]}]}}, {:name=>"highlight-component", :data=>{:content=>"Read the <a href=\"https://pds.blog.parliament.uk/2017/09/06/launching-the-new-search-service-on-parliament-uk/\">MPs and Lords information blog post</a>."}}, {:name=>"content", :data=>{:heading=>"Give feedback", :"additional-text"=>["We want your feedback to <a href=\"http://www.smartsurvey.co.uk/s/ukparliament-beta-website-feedback/\">help us improve these pages</a> further."]}}, {:name=>"content", :data=>{:heading=>"Follow our progress", :"additional-text"=>["Follow all <a href=\"https://pds.blog.parliament.uk/category/parliament-uk/\">new website developments on our blog</a>."]}}, {:name=>"footer", :data=>"footer"}]}

      expect(subject.to_h).to eq expected_hash
    end

    it 'calls the correct component serializers' do
      allow(ComponentSerializer::HeroComponentSerializer).to receive(:new)
      allow(ComponentSerializer::HomePageSubheadingComponentSerializer).to receive(:new)
      allow(ComponentSerializer::ListItemComponentSerializer).to receive(:new)
      allow(ComponentSerializer::ListComponentSerializer).to receive(:new)
      allow(ComponentSerializer::StatusHighlightComponentSerializer).to receive(:new)
      allow(ComponentSerializer::ContentComponentSerializer).to receive(:new)
      subject.to_h
      expect(ComponentSerializer::HeroComponentSerializer).to have_received(:new)
      expect(ComponentSerializer::HomePageSubheadingComponentSerializer).to have_received(:new)
      expect(ComponentSerializer::ListItemComponentSerializer).to have_received(:new).exactly(6).times
      expect(ComponentSerializer::ListComponentSerializer).to have_received(:new).exactly(3).times
      expect(ComponentSerializer::StatusHighlightComponentSerializer).to have_received(:new).exactly(3).times
      expect(ComponentSerializer::ContentComponentSerializer).to have_received(:new).exactly(2).times
    end
  end
end
