require_relative '../../rails_helper'

describe PageSerializer::BasePageSerializer do
  let ( :basepageserializer ) { described_class.new(123) }
  context '#to_h' do
    it 'raises an error' do
      expect { basepageserializer.to_h }.to raise_error("You cannot call title from base page serializer, you must call it from a specific page serializer.")
    end
  end

end
