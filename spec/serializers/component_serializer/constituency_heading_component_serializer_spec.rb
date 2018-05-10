require_relative '../../rails_helper'

describe ComponentSerializer::ConstituencyHeadingComponentSerializer do
  let ( :constituency ) { double('constituency', :name => "Blyth Vally")}
  let ( :constituencyheadingcomponentserializer ) { described_class.new(constituency) }
  context '#to_h' do
    it 'returns a hash containing the name and data' do
      expect(constituencyheadingcomponentserializer.to_h).to eq({:name=>"constituency-heading", :data=>"Blyth Vally"})
    end
  end

end
