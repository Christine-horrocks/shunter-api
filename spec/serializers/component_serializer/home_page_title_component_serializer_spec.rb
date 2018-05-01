require_relative '../../rails_helper'

describe ComponentSerializer::HomePageTitleComponentSerializer do

  context '#to_h' do
    it 'returns a hash containing the name and data' do
      expect(subject.to_h).to eq({:name=>"home-page-title", :data=>{:title=>"Welcome to the UK Parliament's beta website"}})
    end
  end

end
