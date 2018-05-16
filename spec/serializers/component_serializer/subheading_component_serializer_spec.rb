require_relative '../../rails_helper'

RSpec.describe ComponentSerializer::SubheadingComponentSerializer do
  let(:party) { double('party', name: 'Great') }
  let(:current_party_membership) { double('current_party_membership', party: party) }
  let(:constituency) { double('constituency', name: 'Anything') }
  let(:current_seat_incumbency) { double('current_seat_incumbency', constituency: constituency) }
  let(:person) {
    double('person',
           current_party_membership: current_party_membership,
           current_seat_incumbency: current_seat_incumbency,
           statuses: {
               house_membership_status: %w(one two)
           }
    )
  }

  let (:serializer) { described_class.new(person) }

  context '#to_h' do
    it 'returns a hash with the name and Former MP is former_mp? is true' do
      allow(person).to receive(:former_mp?) { true }
      allow(person).to receive(:former_lord?) { false }
      allow(person).to receive(:current_mp?) { false }
      allow(person).to receive(:current_lord?) { false }

      expected = get_fixture('former_mp.yml', __FILE__)

      expect(serializer.to_yaml).to eq expected
    end

    it 'returns a hash with the name and Former MP is former_lord? is true' do
      allow(person).to receive(:former_mp?) { false }
      allow(person).to receive(:former_lord?) { true }
      allow(person).to receive(:current_mp?) { false }
      allow(person).to receive(:current_lord?) { false }

      expected = get_fixture('former_lord.yml', __FILE__)

      expect(serializer.to_yaml).to eq expected
    end

    it 'returns a hash with the name and current MP string is current_mp? is true' do
      allow(person).to receive(:former_mp?) { false }
      allow(person).to receive(:former_lord?) { false }
      allow(person).to receive(:current_mp?) { true }
      allow(person).to receive(:current_lord?) { false }

      expected = get_fixture('current_mp.yml', __FILE__)

      expect(serializer.to_yaml).to eq expected
    end

    it 'returns a hash with the name and current Lord string is current_lord? is true' do
      allow(person).to receive(:former_mp?) { false }
      allow(person).to receive(:former_lord?) { false }
      allow(person).to receive(:current_mp?) { false }
      allow(person).to receive(:current_lord?) { true }

      expected = get_fixture('current_lord.yml', __FILE__)

      expect(serializer.to_yaml).to eq expected
    end
  end
end
