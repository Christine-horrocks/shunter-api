require_relative '../../rails_helper'

describe ComponentSerializer::BaseComponentSerializer do
  context '#to_h' do
    it 'raises an error if called in BaseComponentSerializer' do
      expect { subject.to_h }.to raise_error('You must implement #name')
    end

    it 'raises an error if data is called' do
      expect { subject.data }.to raise_error('You must implement #data')
    end
    
  end
end
