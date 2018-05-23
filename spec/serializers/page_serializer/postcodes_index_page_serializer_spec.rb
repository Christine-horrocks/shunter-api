require_relative '../../rails_helper'

describe PageSerializer::PostcodesIndexPageSerializer, vcr: false do

  let(:serializer) { described_class.new }

  context '#to_h' do
    it 'creates a hash for the postcodes index page' do
      expected = get_fixture('fixture')

      expect(serializer.to_yaml).to eq expected
    end
  end
end
