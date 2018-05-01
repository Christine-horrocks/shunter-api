require_relative '../../rails_helper'

describe ComponentSerializer::HomePageSearchComponentSerializer do

  context '#to_h' do
    it 'returns a hash containing the name and data' do
      expect(subject.to_h).to eq({:name=>"home-page-component", :data=>{:subheading=>"Search", :"list-items"=>[{:"link-text"=>"Search", :link=>"/search", :"additional-text"=>"Find results from current parliament.uk websites."}], :"blog-link"=>"https://pds.blog.parliament.uk/2017/09/06/launching-the-new-search-service-on-parliament-uk/", :"blog-text"=>"Read the Search blog post."}})
    end
  end

end
