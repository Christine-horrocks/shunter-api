require_relative '../../rails_helper'

describe ComponentSerializer::WhenToContactComponentSerializer do
  context '#to_h' do
    it 'returns a hash containing the name and data for when to contact MPs' do
      expect(subject.to_h).to eq({:name=>"when-to-contact", :data=>{:template=>"when-to-contact", :text=>"You may be able to discuss issues with your MP in person or online. Contact them for details."}})
    end
  end
end
