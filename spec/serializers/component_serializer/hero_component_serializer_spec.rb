require_relative '../../rails_helper'

describe ComponentSerializer::HeroComponentSerializer do
  let ( :title ) { 'Welcome to Parliament' }
  let ( :additional_text ) { 'Even more interesting information' }

  let ( :herocomponentserializer ) { described_class.new(title, additional_text) }
  context '#to_h' do
    it 'returns a hash containing the name and data' do
      expect(herocomponentserializer.to_h).to eq({:name=>"hero", :data=>{:title=>"Welcome to Parliament", :"additional-text"=>["Even more interesting information"]}})
    end
  end

end
