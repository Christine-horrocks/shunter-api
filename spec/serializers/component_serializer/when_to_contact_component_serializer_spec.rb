require_relative '../../rails_helper'

describe ComponentSerializer::WhenToContactComponentSerializer do
  context '#to_h' do
    it 'returns a hash containing the name and data for when to contact MPs' do
      expect(subject.to_h).to eq({:name=>"when-to-contact", :data=>{:title=>"When to contact an MP", :"mps-can-help-with"=>"MPs can help with issues that are the responsibility of UK Parliament. They represent their constituents and can help with issues such as:", :list=>["hospitals and the NHS", "problems with benefits, pensions and national insurance", "immigration", "school closures and funding", "transport facilities"], :"who-else-can-help"=>"Who else can help with my issue?", :link=>"/who-should-i-contact-with-my-issue", :"discuss-with"=>"You may be able to discuss issues with your MP in person or online. Contact them for details", :"contact-postcode"=>"Please include your postcode when contacting your MP."}})
    end
  end
end
