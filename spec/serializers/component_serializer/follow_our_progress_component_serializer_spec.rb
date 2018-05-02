require_relative '../../rails_helper'

describe ComponentSerializer::FollowOurProgressComponentSerializer do

  context '#to_h' do
    it 'returns a hash containing the name and data' do
      expect(subject.to_h).to eq({:name=>"home-page-non-list-component", :data=>{:subheading=>"Follow our progress", :"link-text"=>"Follow all new website developments on our blog.", :link=>"https://pds.blog.parliament.uk/category/parliament-uk/"}})
    end
  end

end
