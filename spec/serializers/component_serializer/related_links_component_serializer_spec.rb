require_relative '../../rails_helper'

RSpec.describe ComponentSerializer::RelatedLinksComponentSerializer do
  let (:person_double) {
    double('person_double',
           full_name: 'Diane Abbott',
           image_id: 123,
           personal_weblinks: [1],
           twitter_weblinks: [1])
  }

  let (:serializer) { described_class.new(person_double) }

  context '#to_h' do
    it 'returns a hash with the name and related links data if all data is available' do
      expected = get_fixture('with_all_data')

      expect(serializer.to_yaml).to eq expected
    end

    it 'leaves out name and media-url if image_id is falsey' do
      allow(person_double).to receive(:image_id) { false }

      expected = get_fixture('image_id_falsey')

      expect(serializer.to_yaml).to eq expected
    end

    it 'leaves out website if personal_weblinks is an empty array' do
      allow(person_double).to receive(:personal_weblinks) { [] }

      expected = get_fixture('personal_weblinks_empty')

      expect(serializer.to_yaml).to eq expected
    end

    it 'leaves out twitter if twitter_weblinks is an empty array' do
      allow(person_double).to receive(:twitter_weblinks) { [] }

      expected = get_fixture('twitter_weblinks_empty')

      expect(serializer.to_yaml).to eq expected
    end
  end
end