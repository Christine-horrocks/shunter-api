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
  let ( :constituencyshowpageserializer ) { described_class.new(constituency,json_location,member, party,seat_incumbencies) }

  context '#to_h' do

      it 'initializes component serializers' do
        constituency_heading_component_serializer = class_double('ComponentSerializer::ConstituencyHeadingComponentSerializer').as_stubbed_const
        constituency_subheading_component_serializer = class_double('ComponentSerializer::ConstituencySubheadingComponentSerializer').as_stubbed_const
        map_component_serializer = class_double('ComponentSerializer::MapComponentSerializer').as_stubbed_const
        person_component_serializer = class_double('ComponentSerializer::PersonComponentSerializer').as_stubbed_const
        former_seat_incumbencies_component_serializer = class_double('ComponentSerializer::FormerSeatIncumbenciesComponentSerializer').as_stubbed_const


        expect(constituency_heading_component_serializer).to receive(:new).with(constituency)
        expect(constituency_subheading_component_serializer).to receive(:new).with(constituency)
        expect(map_component_serializer).to receive(:new).with(constituency, json_location)
        expect(person_component_serializer).to receive(:new).with(member, {
          constituency_show_page: true, constituency_name: constituency.name
          })
        expect(former_seat_incumbencies_component_serializer).to receive(:new).with(seat_incumbencies)

        constituencyshowpageserializer.to_h
      end

      it 'produces a hash containg the data to create a constituency show page when current' do
        expect(constituencyshowpageserializer.to_h).to eq({:layout=>{:template=>"layout"}, :title=>"Constituency ", :components=>[{:name=>"cookie-banner", :data=>"cookie-banner"}, {:name=>"banner", :data=>"banner"}, {:name=>"header", :data=>"header"}, {:name=>"constituency-heading", :data=>"Constituency"}, {:name=>"constituency-subheading", :data=>{:current=>true, :subheading=>"{:name=>\"NorthEast\"}", :additional_text=>"Constituency in "}}, {:name=>"map", :data=>{:"constituency-name"=>"Interactive map of Constituency", :"json-location"=>"here", :"enable-javascript"=>"A map of the constituency is available. To view it JavaScript must enabled."}}, {:name=>"people", :data=>[{:display_name=>"MP for this place", :graph_id=>"121212", :image_url=>"https://api.parliament.uk/Live/photo/121212.jpeg?crop=CU_1:1&amp;width=186&amp;quality=80", :role=>"MP for Constituency", "current_party"=>"Labour"}]}, {:name=>"former-seat-incumbencies", :data=>{:title=>"Former MPs", :"former-seat-incumbency-list"=>[1, 1, 1]}}, {:name=>"footer", :data=>"footer"}]})
      end

      it 'produces a hash containg limited data to create a constituency show page when former' do
        allow(constituency).to receive(:current?) {false}
        allow(constituency).to receive(:date_range) {"12-12"}
        expect(constituencyshowpageserializer.to_h).to eq({:layout=>{:template=>"layout"}, :title=>"Constituency ", :components=>[{:name=>"cookie-banner", :data=>"cookie-banner"}, {:name=>"banner", :data=>"banner"}, {:name=>"header", :data=>"header"}, {:name=>"constituency-heading", :data=>"Constituency"}, {:name=>"constituency-subheading", :data=>{:current=>false, :subheading=>"Constituency from  12-12", :additional_text=>"This is a former constituency. <a href=\"/constituencies/current\">View current constituencies</a>."}}, {:name=>"former-seat-incumbencies", :data=>{:title=>"Former MPs", :"former-seat-incumbency-list"=>[1, 1, 1]}}, {:name=>"footer", :data=>"footer"}]})
      end

  end
end
