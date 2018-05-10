require_relative '../../rails_helper'

describe ComponentSerializer::ContactComponentSerializer do
  let (:postal_address2) { double('postal_address2', :full_address => "2parliament") }
  let (:postal_address1) { double('postal_address1', :full_address => "1parliament") }
  let (:postal_addresses) { [postal_address1, postal_address2] }
  let (:contact_point) { double('contact_point1', :email => "parliament@parliament.com", :phone_number => 12121212, :postal_addresses => postal_addresses) }
  let (:contact_points) { [contact_point] }
  let (:current_seat_incumbency) { double('current_seat_incumbency', :contact_points => contact_points) }
  let (:object) { double('object', :current_seat_incumbency => current_seat_incumbency) }
  let (:contactcomponentserializer) { described_class.new(object) }
  context '#to_h' do
    it 'returns a hash containing the name and data for when to contact MPs' do
      expect(contactcomponentserializer.to_h).to eq({:name=>"contact", :data=>{:title=>"Contact", :email=>"Email: ", :phone=>"Phone: ", :address=>"Address: ", :"contact-points"=>[{:email=>"parliament@parliament.com", :phone=>12121212, :addresses=>["1parliament", "2parliament"]}]}})
    end
  end
end
