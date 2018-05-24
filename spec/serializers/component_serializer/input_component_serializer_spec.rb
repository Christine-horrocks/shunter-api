require_relative '../../rails_helper'

describe ComponentSerializer::InputComponentSerializer, vcr: false do

  let(:value) { 'value' }
  let(:pattern) { 123 }
  let(:maxlength) { '8' }
  let(:id) { 'postcode1' }
  let(:name) { 'postcode' }
  let(:type) { 'text' }

  let(:serializer) {
    described_class.new(
        type: type,
        name: name,
        id: id,
        maxlength: maxlength,
        pattern: pattern,
        value: value
    )
  }

  context '#to_h' do
    context 'produces the correct hash' do
      it 'with all information' do
        expected = get_fixture('with_all_information')

        expect(serializer.to_yaml).to eq expected
      end

      it 'with only, type, name, id and value' do
        input_serializer = described_class.new(type: 'hidden', name: 'previous_controller', id: 'previous_controller', value: 'postcodes')

        expected = get_fixture('only_type_name_id_value')

        expect(input_serializer.to_yaml).to eq expected
      end

      it 'with only type, name, id, maxlength and pattern' do
        input_serializer = described_class.new(type: 'text', name: 'postcode', id: 'postcode', maxlength: '8', pattern: '[0-9a-zA-Z ]{5,}')

        expected = get_fixture('only_type_name_id_maxlength_pattern')

        expect(input_serializer.to_yaml).to eq expected
      end
    end
  end

end