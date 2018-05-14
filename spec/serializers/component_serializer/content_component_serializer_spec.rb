require_relative '../../rails_helper'

describe ComponentSerializer::ContentComponentSerializer do
  let ( :heading ) { 'Important things' }
  let ( :additional_text ) { 'Even more interesting information' }

  let ( :contentcomponentserializer ) { described_class.new(heading, additional_text) }
  context '#to_h' do
    it 'returns a hash containing the name and data' do
      expect(contentcomponentserializer.to_h).to eq({:name=>"content", :data=>{:heading=>"Important things", :"additional-text"=>["Even more interesting information"]}})
    end
  end

end
