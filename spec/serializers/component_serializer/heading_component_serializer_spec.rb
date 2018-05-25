require_relative '../../rails_helper'

describe ComponentSerializer::HeadingComponentSerializer do
  let ( :heading ) { "Dianne Abbott" }
  let ( :size ) { 1 }
  let ( :headingcomponentserializer ) { described_class.new(heading, size: size) }
  context '#to_h' do
    it 'returns a hash containing the name and data' do
      expected = get_fixture('hash')

      expect(headingcomponentserializer.to_yaml).to eq expected
    end
  end

end
