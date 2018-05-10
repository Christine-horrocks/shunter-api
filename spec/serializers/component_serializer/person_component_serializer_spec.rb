require_relative '../../rails_helper'

describe ComponentSerializer::PersonComponentSerializer do

  let (:party) { double('party', name: "Labour") }
  let (:constituency) { double('constituency', name: "Hackney") }
  let (:current_party_membership) { double('current_party_membership', party: party) }
  let (:current_seat_incumbency) { double('current_seat_incumbency', constituency: constituency) }
  let (:person) { double('person', current_party_membership: current_party_membership,
                                   current_seat_incumbency: current_seat_incumbency,
                                   statuses: { house_membership_status: ["Lord", "Lady"] },
                                   display_name: "Person",
                                   graph_id: "121212",
                                   former_mp?: false,
                                   former_lord?: false,
                                   current_mp?: false,
                                   current_lord?: false,
                                   image_id: "121212"
                                     )}
  let (:personcomponentserializer) { described_class.new(person) }

  context '#to_h' do

    it 'returns a hash for a complete current MP' do
      allow(person).to receive(:current_mp?) {true}
      expect(personcomponentserializer.to_h).to eq({:display_name=>"Person", :graph_id=>"121212", :image_url=>"https://api.parliament.uk/Live/photo/121212.jpeg?crop=CU_1:1&amp;width=186&amp;quality=80", :role=>"MP for Hackney", "current_party"=>"Labour"})
    end

    it 'returns a hash for a complete former MP' do
      allow(person).to receive(:former_mp?) {true}
      expect(personcomponentserializer.to_h).to eq({:display_name=>"Person", :graph_id=>"121212", :image_url=>"https://api.parliament.uk/Live/photo/121212.jpeg?crop=CU_1:1&amp;width=186&amp;quality=80", :role=>"Former MP"})
    end

    it 'returns a hash for a complete current Lord' do
      allow(person).to receive(:current_lord?) {true}
      expect(personcomponentserializer.to_h).to eq({:display_name=>"Person", :graph_id=>"121212", :image_url=>"https://api.parliament.uk/Live/photo/121212.jpeg?crop=CU_1:1&amp;width=186&amp;quality=80", :role=>"Lord and Lady", "current_party"=>"Labour"})
    end

    it 'returns a hash for a complete former Lord' do
      allow(person).to receive(:former_lord?) {true}
      expect(personcomponentserializer.to_h).to eq({:display_name=>"Person", :graph_id=>"121212", :image_url=>"https://api.parliament.uk/Live/photo/121212.jpeg?crop=CU_1:1&amp;width=186&amp;quality=80", :role=>"Former Member of the House of Lords"})
    end

    it 'returns a hash for a current MP WITHOUT current_party' do
      allow(person).to receive(:current_mp?) {true}
      allow(person).to receive(:current_party_membership) {nil}
      expect(personcomponentserializer.to_h).to eq({:display_name=>"Person", :graph_id=>"121212", :image_url=>"https://api.parliament.uk/Live/photo/121212.jpeg?crop=CU_1:1&amp;width=186&amp;quality=80", :role=>"MP for Hackney"})
    end

    it 'returns a hash for a current MP WITHOUT image_id' do
      allow(person).to receive(:current_mp?) {true}
      allow(person).to receive(:image_id) {nil}
      expect(personcomponentserializer.to_h).to eq({:display_name=>"Person", :graph_id=>"121212", :image_url=>"https://api.parliament.uk/Live/photo/.jpeg?crop=CU_1:1&amp;width=186&amp;quality=80", :role=>"MP for Hackney", "current_party"=>"Labour"})
    end

  end

end
