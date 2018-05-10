require_relative '../../rails_helper'

describe ComponentSerializer::HomePageSubheadingComponentSerializer do

  context '#to_h' do
    it 'returns a hash containing the name and data' do
      expect(subject.to_h).to eq({:name=>"home-page-subheading", :data=>{:subheading=>"What's on beta.parliament.uk"}})
    end
  end

end
