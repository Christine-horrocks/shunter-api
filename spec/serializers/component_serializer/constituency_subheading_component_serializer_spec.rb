require_relative '../../rails_helper'

describe ComponentSerializer::ConstituencySubheadingComponentSerializer do
  let (:region) { double('region', name: 'North East', first: 'North East') }
  let (:regions) { double('regions', map: region) }
  let (:constituency) { double('constituency', regions: regions)}
  let (:constituencysubheadingcomponentserializer) { described_class.new(constituency) }
  context '#to_h' do
    it 'returns a hash containing the name and data' do
      expect(constituencysubheadingcomponentserializer.to_h).to eq({ :name=>"constituency-subheading", :data=>"North East" })
    end
  end

end
