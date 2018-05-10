require_relative '../../rails_helper'

describe ComponentSerializer::BaseComponentSerializer do

  context '#to_h' do
    it 'raises an error if called in BaseComponentSerializer' do

      expect { subject.to_h }.to raise_error("Name can only be called through a specific component serializer, not through the generic base component serializer")
    end
  end

end
