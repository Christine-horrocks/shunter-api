require_relative '../../rails_helper'

describe ComponentSerializer::StatusHighlightComponentSerializer do
  let ( :content ) { 'Things' }
  let ( :statushighlightcomponentserializer ) { described_class.new(content) }

  context '#to_h' do
    it 'returns a hash containing the name and data' do
      expect(statushighlightcomponentserializer.to_h).to eq({:name=>"highlight-component", :data=>{:content=>"Things"}})
    end
  end

end
