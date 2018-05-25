require_relative '../../rails_helper'

describe PageSerializer::PostcodesShowPageSerializer, vcr: false do

  let(:current_party) { double('current_party', name: 'Labour') }
  let(:person_constituency) { double('person_constituency', name: 'Leith') }
  let(:current_seat_incumbency) { double('current_seat_incumbency', constituency: constituency) }
  let(:person) { double('person', graph_id: 321, display_name: 'Display Name', current_seat_incumbency: current_seat_incumbency, current_party: current_party) }
  let(:postcode) { 'eh6 5ez' }
  let(:constituency) { double('constituency', graph_id: 123, name: 'Constituency') }
  let(:serializer) { described_class.new(constituency, postcode, person) }

  context '#to_h' do
    context 'creating correct hashes' do
      it 'for the postcodes show page' do
        expected = get_fixture('fixture')

        expect(serializer.to_yaml).to eq expected
      end
    end
  end
end