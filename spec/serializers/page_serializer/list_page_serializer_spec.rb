require_relative '../../rails_helper'

describe PageSerializer::ListPageSerializer, vcr: false do
  let (:objects) { double('objects', each: [1, 2])}
  let (:klass) { double('klass')}
  let (:objects_name) { 'object' }
  let (:letters) { double('letters', include?: true)}
  let (:active_letter) { 'a'}
  let ( :list_page_serializer ) { described_class.new(objects, klass, objects_name, letters, active_letter) }

  context '#to_h' do
    it 'produces a hash containg a list of objects' do
      expected_hash = get_fixture('page_serializer/list_page_serializer/hash.yml')

      expect(list_page_serializer.to_h.to_yaml).to eq(expected_hash)
    end

  end
end
