require_relative '../../rails_helper'

RSpec.describe ComponentSerializer::ConstituencySubheadingComponentSerializer do
  let (:region) { double('region', name: 'North East', first: 'North East') }
  let (:regions) { double('regions', map: region) }
  let (:constituency) { double('constituency', regions: regions, current?: true, date_range: '12-12')}
  let (:constituency_subheading_component_serializer) { described_class.new(constituency) }

  context '#to_h' do
    it 'returns a hash containing the name and data if current' do
      expected = get_fixture('current', __FILE__)

      expect(constituency_subheading_component_serializer.to_yaml).to eq expected
    end

    it 'returns a hash containing the name and date if former' do
      allow(constituency).to receive(:current?) { false }

      expected = get_fixture('former', __FILE__)

      expect(constituency_subheading_component_serializer.to_yaml).to eq expected
    end
  end
end
