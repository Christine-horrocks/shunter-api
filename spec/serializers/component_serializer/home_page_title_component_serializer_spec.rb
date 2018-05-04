require_relative '../../rails_helper'

describe ComponentSerializer::HomePageTitleComponentSerializer do

  context '#to_h' do
    it 'returns a hash containing the name and data' do
      expect(subject.to_h).to eq({:name=>"home-page-title", :data=>{:title=>"Welcome to the UK Parliament test website", :"text-with-new-website-link"=>"We’re building a <a href=\"https://pds.blog.parliament.uk/2017/02/14/a-new-website-for-parliament-first-public-steps/\">new website for Parliament</a>. These pages are being tested and improved – They may not work for everyone.", :"text-with-old-website-link"=>"Test pages are separate from the current <a href=\"https://www.parliament.uk\">parliament.uk</a> website."}})
    end
  end

end
