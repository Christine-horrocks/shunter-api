require_relative '../../rails_helper'

describe PageSerializer::PersonShowPageSerializer, vcr: false do
  let (:postal_address2) { double('postal_address2', :full_address => "2parliament") }
  let (:postal_address1) { double('postal_address1', :full_address => "1parliament") }
  let (:postal_addresses) { [postal_address1, postal_address2] }
  let (:contact_point) { double('contact_point1', :email => "parliament@parliament.com", :phone_number => 12121212, :postal_addresses => postal_addresses) }
  let (:contact_points) { [contact_point] }
  let (:current_seat_incumbency) { double('current_seat_incumbency', constituency: constituency, contact_points: contact_points) }
  let (:constituency) { double('constituency', name: "Hackney") }
  let (:party) { double('party', name: "Labour") }
  let (:current_party_membership) { double('current_party_membership', party: party) }
  let (:person) { double('person',
                                   current_party_membership: current_party_membership,
                                   current_seat_incumbency: current_seat_incumbency,
                                   statuses: { house_membership_status: ["Lord", "Lady"] },
                                   display_name: "Person",
                                   full_name: "Parlimentarian",
                                   graph_id: "121212",
                                   former_mp?: false,
                                   former_lord?: false,
                                   current_mp?: true,
                                   current_lord?: false,
                                   image_id: "121212",
                                   incumbencies: ["yes"],
                                   weblinks?: true,
                                   personal_weblinks: ["MP.com"],
                                   twitter_weblinks: ["MPtwitter.com"]
                                     )}
  let ( :personshowpageserializer ) { described_class.new(person) }
  context '#to_h' do
    it 'produces a hash containg the data to create a person show page' do
      expect(personshowpageserializer.to_h).to eq({:layout=>{:template=>"layout"}, :title=>"Person UK Parliament", :components=>[{:name=>"cookie-banner", :data=>"cookie-banner"}, {:name=>"banner", :data=>"banner"}, {:name=>"header", :data=>"header"}, {:name=>"heading1", :data=>"Parlimentarian"}, {:name=>"subheading", :data=>"Labour MP for Hackney"}, {:name=>"image", :data=>{:template=>"person-image", :"figure-url"=>"/media/121212", :"image-srcset1"=>"https://api.parliament.uk/Staging/photo/121212.jpeg?crop=CU_5:2&width=732&quality=80, https://api.parliament.uk/Staging/photo/121212.jpeg?crop=CU_5:2&width=1464&quality=80 2x", :"image-srcset2"=>"https://api.parliament.uk/Staging/photo/121212.jpeg?crop=MCU_3:2&width=444&quality=80, https://api.parliament.uk/Staging/photo/121212.jpeg?crop=MCU_3:2&width=888&quality=80 2x", :"image-src"=>"https://api.parliament.uk/Staging/photo/121212.jpeg?crop=CU_1:1&width=186&quality=80", :"image-alt"=>"Person"}}, {:name=>"when-to-contact", :data=>{:template=>"when-to-contact", :text=>"You may be able to discuss issues with your MP in person or online. Contact them for details."}}, {:name=>"contact", :data=>{:template=>"contact", :"contact-points"=>[{:email=>"parliament@parliament.com", :phone=>12121212, :addresses=>["1parliament", "2parliament"]}]}}, {:name=>"roles", :data=>{:template=>"roles", :"role-list"=>[]}}, {:name=>"timeline", :data=>{:template=>"timeline", :"timeline-roles"=>[{:"time-period"=>"Held currently", :roles=>[]}]}}, {:name=>"related-links", :data=>{"template"=>"related-links", "name"=>"Parlimentarian", "website"=>["MP.com"], "twitter"=>["MPtwitter.com"], "media-url"=>"/media/121212"}}, {:name=>"footer", :data=>"footer"}]})
    end
  end

end
