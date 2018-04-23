require_relative '../../rails_helper'

describe ComponentSerializer::TimelineComponentSerializer do
  let (:history) { {current: true} }
  let (:roles_component_serializer_instance) { double('roles_serializer_instance', current_roles: 'These are your currant roles')}
  let (:role_helper) { double('role_helper', create_role_history: history, build_timeline: 'This is your timeline')}
  let (:roles_component_serializer) { double('roles_component_serializer', new: roles_component_serializer_instance)}
  let (:timelinecomponentserializer) { described_class.new(1, 2, 3, 4, role_helper, roles_component_serializer) }

  context '#to_h' do
    it 'returns a hash containing the name and data for MPs roles' do
      expect(timelinecomponentserializer.to_h).to eq({:name=>"timeline", :data=>{:template=>"timeline", :"timeline-roles"=>"This is your timeline"}})
    end

    it 'is called with create_role_history and current_roles' do
      timelinecomponentserializer.to_h
      expect(role_helper).to have_received(:create_role_history)
      expect(roles_component_serializer_instance).to have_received(:current_roles)
    end
  end

end
