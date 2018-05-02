require_relative '../../rails_helper'

describe ComponentSerializer::GiveFeedbackComponentSerializer do

  context '#to_h' do
    it 'returns a hash containing the name and data' do
      expect(subject.to_h).to eq({:name=>"home-page-non-list-component", :data=>{:subheading=>"Give feedback", :"link-text"=>"We want your feedback to help us improve these pages further.", :link=>"http://www.smartsurvey.co.uk/s/ukparliament-beta-website-feedback/"}})
    end
  end

end
