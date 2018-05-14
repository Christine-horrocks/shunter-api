require_relative '../../rails_helper'

describe ComponentSerializer::ConstituencySubheadingComponentSerializer do
  let (:region) { double('region', name: 'North East', first: 'North East') }
  let (:regions) { double('regions', map: region) }
  let (:constituency) { double('constituency', regions: regions, current?: true, date_range: "12-12")}
  let (:constituencysubheadingcomponentserializer) { described_class.new(constituency) }
  context '#to_h' do
    it 'returns a hash containing the name and data if current' do
      expect(constituencysubheadingcomponentserializer.to_h).to eq({ :name=>"constituency-subheading", :data=>{:current=>true, :subheading=>"North East", :additional_text=>"Constituency in "} })
    end

    it 'returns a hash containing the name and date if former' do
      allow(constituency).to receive(:current?) {false}
      expect(constituencysubheadingcomponentserializer.to_h).to eq({ :name=>"constituency-subheading", :data=>{:current=>false, :subheading=>"Constituency from  12-12", :additional_text=>"This is a former constituency. <a href=\"/constituencies/current\">View current constituencies</a>."} })
    end

  end
end
