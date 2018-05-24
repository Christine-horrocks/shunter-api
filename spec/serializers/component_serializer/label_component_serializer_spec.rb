require_relative '../../rails_helper'

describe ComponentSerializer::LabelComponentSerializer, vcr: false do

  let(:serializer) { described_class.new('for', 'text') }

  context '#to_h' do
    it 'produces the correct hash' do
      expected = get_fixture('fixture')

      expect(serializer.to_yaml).to eq expected
    end
  end

end