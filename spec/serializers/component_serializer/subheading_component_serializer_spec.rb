require_relative '../../rails_helper'

describe ComponentSerializer::SubheadingComponentSerializer do
  let ( :party ) {double('party', :name => "Labour")}
  let ( :constituency ) {double('constituency', :name => "Hackney")}
  let ( :current_party_membership ) {double('current_party_membership', :party => party)}
  let ( :current_seat_incumbency ) {double('current_seat_incumbency', :constituency => constituency)}
  let ( :person ) { double('person', :current_party_membership => current_party_membership, :current_seat_incumbency => current_seat_incumbency, :statuses => {:house_membership_status => ["Lord", "Lady"]})}
  let ( :subheadingcomponentserializer ) { described_class.new(person) }
  context '#to_h' do
    it 'returns a hash containing the name and data for former_mp' do
      allow(person).to receive(:former_mp?) {true}
      allow(person).to receive(:former_lord?) {false}
      allow(person).to receive(:current_mp?) {false}
      allow(person).to receive(:current_lord?) {false}
      expect(subheadingcomponentserializer.to_h).to eq({:name=>"subheading", :data=>"Former MP"})
    end

    it 'returns a hash containing the name and data for former_lord' do
      allow(person).to receive(:former_mp?) {false}
      allow(person).to receive(:former_lord?) {true}
      allow(person).to receive(:current_mp?) {false}
      allow(person).to receive(:current_lord?) {false}
      expect(subheadingcomponentserializer.to_h).to eq({:name=>"subheading", :data=>"Former Member of the House of Lords"})
    end

    it 'returns a hash containing the name and data for current_mp' do
      allow(person).to receive(:former_mp?) {false}
      allow(person).to receive(:former_lord?) {false}
      allow(person).to receive(:current_mp?) {true}
      allow(person).to receive(:current_lord?) {false}
      expect(subheadingcomponentserializer.to_h).to eq({:name=>"subheading", :data=>"Labour MP for Hackney"})
    end

    it 'returns a hash containing the name and data for current_mp' do
      allow(person).to receive(:former_mp?) {false}
      allow(person).to receive(:former_lord?) {false}
      allow(person).to receive(:current_mp?) {false}
      allow(person).to receive(:current_lord?) {true}
      expect(subheadingcomponentserializer.to_h).to eq({:name=>"subheading", :data=>"Labour - Lord and Lady"})
    end

  end
end
