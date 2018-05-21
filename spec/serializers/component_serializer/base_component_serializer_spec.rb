require_relative '../../rails_helper'

describe ComponentSerializer::BaseComponentSerializer do
  context '#to_h' do
    it 'raises an error if called in BaseComponentSerializer' do
      expect { subject.to_h }.to raise_error('You must implement #name')
    end
  end
end
