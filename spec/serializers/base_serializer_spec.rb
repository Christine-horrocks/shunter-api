require_relative '../rails_helper'

describe BaseSerializer do
  context '#to_h' do
    it 'raises an error if called in BaseSerializer' do

      expect { subject.to_h }.to raise_error("You must call content through a specific class, you cannot cal lit through BaseSerializer.")
    end
  end
end
