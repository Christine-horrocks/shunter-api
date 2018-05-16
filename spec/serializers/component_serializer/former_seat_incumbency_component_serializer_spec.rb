require_relative '../../rails_helper'


describe ComponentSerializer::FormerSeatIncumbenciesComponentSerializer do
  let(:member) { double('member', display_name: 'Former MP', graph_id: "121212") }
  let(:seat_incumbency2) { double('seat_incumbency2', current?: false, member: member, date_range: "121212" ) }
  let(:seat_incumbency1) { double('seat_incumbency1', current?: true ) }
  let(:seat_incumbencies) { [seat_incumbency1, seat_incumbency2] }
  let(:former_seat_incumbencies_component_serializer) { described_class.new(seat_incumbencies) }

  context '#to_h' do

    it 'returns a hash containing the name and data for the former seat incumbencies' do
      expected = get_fixture('component_serializer/former_seat_incumbencies_component_serializer/fixture.yml')

      expect(former_seat_incumbencies_component_serializer.to_yaml).to eq expected
  end
 end
end
