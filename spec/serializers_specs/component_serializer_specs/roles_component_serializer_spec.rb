require_relative '../../rails_helper'

describe ComponentSerializer::RolesComponentSerializer do

  let (:history) { {current: true} }
  let (:role_helper) {double('role_helper', create_role_history: history, organise_roles: "This is your history")}
  let (:rolescomponentserializer) { described_class.new(1, 2, 3, 4, role_helper) }

  context '#to_h' do
    it 'returns a hash containing the name and data for MPs roles' do
      expect(rolescomponentserializer.to_h).to eq({ name: "roles", data: { template: "roles", :"role-list"=>"This is your history"}})
    end
  end

  context '#current_roles' do
    it 'is called with create_role_history and organise_roles' do
      rolescomponentserializer.to_h
      expect(role_helper).to have_received(:create_role_history)
      expect(role_helper).to have_received(:organise_roles)
    end
  end

end
