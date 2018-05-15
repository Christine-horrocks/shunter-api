require_relative '../../rails_helper'

describe ComponentSerializer::HeadingComponentSerializer do
  let ( :heading ) { "Dianne Abbott" }
  let ( :weight ) { 1 }
  let ( :headingcomponentserializer ) { described_class.new(heading, weight) }
  context '#to_h' do
    it 'returns a hash containing the name and data' do
      expect(headingcomponentserializer.to_h).to eq({:name=>"heading", :data=>{ "heading": "Dianne Abbott", "weight": 1 }})
    end
  end

end
