require_relative '../../rails_helper'

RSpec.describe ComponentSerializer::RolesListComponentSerializer do
  let(:current_roles) { ['role1', 'role2', 'role3'] }
  let(:serializer) { described_class.new(current_roles) }

  context '#to_h' do
    it 'returns a hash containing the name and data for the role list' do
          expected = get_fixture('fixture')

          expect(serializer.to_yaml).to eq expected
        end

  end
end
