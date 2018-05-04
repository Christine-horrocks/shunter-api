require_relative '../../rails_helper'

describe ComponentSerializer::ObjectToABillComponentSerializer do

  context '#to_h' do
    it 'returns a hash containing the name and data' do
      expect(subject.to_h).to eq({:name=>"home-page-component", :data=>{:subheading=>"Object to a bill", :"list-items"=>[{:"text-with-link"=>"Object to <a href=\"/petition-a-hybrid-bill/2\">the Additional Provision to the High Speed Rail (West Midlands to Crew) Bill</a>"}], :"blog-text-with-link"=>"Read the <a href=\"https://pds.blog.parliament.uk/2018/02/09/building-a-new-online-service-petitioning-a-hybrid-bill/\">Object to a bill blog post</a>."}})
    end
  end

end
