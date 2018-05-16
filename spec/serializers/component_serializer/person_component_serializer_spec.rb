require_relative '../../rails_helper'

describe ComponentSerializer::PersonComponentSerializer do
  let(:party) { double('party', name: 'Labour') }
  let(:constituency) { double('constituency', name: 'Hackney') }
  let(:current_party_membership) { double('current_party_membership', party: party) }
  let(:current_seat_incumbency) { double('current_seat_incumbency', constituency: constituency) }
  let(:person) { double('person', current_party_membership: current_party_membership,
                                   current_seat_incumbency: current_seat_incumbency,
                                   statuses: { house_membership_status: %w(Lord Lady) },
                                   display_name: 'Person',
                                   graph_id: '121212',
                                   former_mp?: false,
                                   former_lord?: false,
                                   current_mp?: false,
                                   current_lord?: false,
                                   image_id: '121212'
                                     )}

  let(:person_component_serializer) { described_class.new(person) }

  context '#to_h' do
    it 'returns a hash for a complete current MP' do
      allow(person).to receive(:current_mp?) { true }
      expected = get_fixture('component_serializer/person_component_serializer/complete_current_mp.yml')

      expect(person_component_serializer.to_yaml).to eq expected
    end

    it 'returns a hash for a complete former MP' do
      allow(person).to receive(:former_mp?) { true }

      expected = get_fixture('component_serializer/person_component_serializer/complete_former_mp.yml')

      expect(person_component_serializer.to_yaml).to eq expected
    end

    it 'returns a hash for a complete current Lord' do
      allow(person).to receive(:current_lord?) { true }

      expected = get_fixture('component_serializer/person_component_serializer/complete_current_lord.yml')

      expect(person_component_serializer.to_yaml).to eq expected
    end

    it 'returns a hash for a complete former Lord' do
      allow(person).to receive(:former_lord?) { true }

      expected = get_fixture('component_serializer/person_component_serializer/complete_former_lord.yml')

      expect(person_component_serializer.to_yaml).to eq expected
    end

    it 'returns a hash for a current MP WITHOUT current_party' do
      allow(person).to receive(:current_mp?) { true }
      allow(person).to receive(:current_party_membership) { nil }

      expected = get_fixture('component_serializer/person_component_serializer/current_mp_without_membership.yml')

      expect(person_component_serializer.to_yaml).to eq expected
    end

    it 'returns a hash for a current MP WITHOUT image_id' do
      allow(person).to receive(:current_mp?) { true }
      allow(person).to receive(:image_id) { nil }

      expected = get_fixture('component_serializer/person_component_serializer/current_mp_without_image_id.yml')

      expect(person_component_serializer.to_yaml).to eq expected
    end
  end
end
