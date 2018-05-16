require_relative '../../rails_helper'

describe PageSerializer::ConstituencyShowPageSerializer, vcr: false do
  let (:party) { double('party', name: "Labour") }
  let (:seat_incumbency_list){ [1,1,1] }
  let (:selected_incumbencies) { double('selected_incumbencies', map: seat_incumbency_list)}
  let (:seat_incumbencies) { double('seat_incumbencies', select: selected_incumbencies) }
  let (:current_seat_incumbency) { double('current_seat_incumbency', constituency: constituency) }
  let (:current_party_membership) { double('current_party_membership', party: party) }
  let (:member) { double('member', display_name: 'MP for this place',
        graph_id: '121212',
        image_id: '121212',
        former_mp?: false,
        former_lord?: false,
        current_mp?: true,
        current_seat_incumbency: current_seat_incumbency,
        current_lord?: false,
        current_party_membership: current_party_membership ) }
  let (:json_location) { "here"}
  let (:region) { double('region', first: { name: 'NorthEast' }) }
  let (:regions) { double('regions', map: region) }
  let (:constituency) { double('constituency', name: "Constituency", regions: regions, current?: true)}
  let ( :constituency_show_page_serializer ) { described_class.new(constituency,json_location,member, party,seat_incumbencies) }

  context '#to_h' do
    it 'initializes component serializers' do
      allow(ComponentSerializer::ConstituencyHeadingComponentSerializer).to receive(:new)
      allow(ComponentSerializer::ConstituencySubheadingComponentSerializer).to receive(:new)
      allow(ComponentSerializer::MapComponentSerializer).to receive(:new)
      allow(ComponentSerializer::PersonComponentSerializer).to receive(:new)
      allow(ComponentSerializer::FormerSeatIncumbenciesComponentSerializer).to receive(:new)

      constituency_show_page_serializer.to_h

      expect(ComponentSerializer::ConstituencyHeadingComponentSerializer).to have_received(:new).with(constituency)
      expect(ComponentSerializer::ConstituencySubheadingComponentSerializer).to have_received(:new).with(constituency)
      expect(ComponentSerializer::MapComponentSerializer).to have_received(:new).with(constituency, json_location)
      expect(ComponentSerializer::PersonComponentSerializer).to have_received(:new).with(member, {
          constituency_show_page: true, constituency_name: constituency.name
      })
      expect(ComponentSerializer::FormerSeatIncumbenciesComponentSerializer).to have_received(:new).with(seat_incumbencies)
    end

    it 'produces the correct hash for a current constituency show page' do
      expected = get_fixture('current_constituency_hash')

      expect(constituency_show_page_serializer.to_yaml).to eq expected
    end

    it 'produces the correct hash for a former constituency show page' do
      allow(constituency).to receive(:current?) {false}
      allow(constituency).to receive(:date_range) {"12-12"}

      expected = get_fixture('former_constituency_hash')

      expect(constituency_show_page_serializer.to_yaml).to eq expected
    end
  end
end
