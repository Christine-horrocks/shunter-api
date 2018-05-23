require_relative '../../rails_helper'

describe ComponentSerializer::FormComponentSerializer, vcr: false do

  let(:id) { 'postcodeSearch' }
  let(:action) { '/postcodes/lookup' }
  let(:method) { 'post' }
  let(:inner_div_class) { 'input-group' }
  let(:components) { [1, 2] }

  let(:serializer) { described_class.new(id, action, method, inner_div_class, components) }

  context '#to_h' do
    it 'produces the correct hash' do
      expected = get_fixture('fixture')

      expect(serializer.to_yaml).to eq expected
    end
  end

end