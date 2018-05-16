require_relative '../../rails_helper'

describe PageSerializer::ListPageSerializer, vcr: false do

  let(:active_letter) { 'C' }
  let(:letters) { %w{A C} }
  let(:object_name) { 'object name' }
  let(:klass_instance) { double('klass_instance', to_h: 'method') }
  let(:klass) { double('klass', new: klass_instance) }
  let(:objects) { [1, 2, 3] }

  let(:serializer) { described_class.new(objects, klass, object_name, letters, active_letter) }

  context '#to_h' do
    it 'creates a hash for the list page' do
      expected = get_fixture('page_serializer/list_page_serializer/hash.yml')

      expect(serializer.to_h.to_yaml).to eq(expected)
    end

    it 'calls the correct component serializers' do
      allow(ComponentSerializer::ListTitleComponentSerializer).to receive(:new)
      allow(ComponentSerializer::LetterNavigationComponentSerializer).to receive(:new)

      serializer.to_h

      expect(ComponentSerializer::ListTitleComponentSerializer).to have_received(:new).with(object_name)
      expect(ComponentSerializer::LetterNavigationComponentSerializer).to have_received(:new).with(letters, active_letter, object_name)
    end
  end
end
