require_relative '../../rails_helper'

describe ComponentSerializer::Heading1ComponentSerializer do
  let ( :person ) { double("person", :full_name => "Dianne Abbott")}
  let ( :heading1componentserializer ) { described_class.new(person) }
  context '#to_h' do
    it 'returns a hash containing the name and data' do
      expect(heading1componentserializer.to_h).to eq({:name=>"heading1", :data=>"Dianne Abbott"})
    end
  end

end
