require_relative '../../rails_helper'

describe ComponentSerializer::WhenToContactComponentSerializer do
  context '#to_h' do
    it 'returns a hash containing the name and data for when to contact MPs' do
      expected = get_fixture('fixture')

      expect(subject.to_yaml).to eq expected
    end
  end
end
