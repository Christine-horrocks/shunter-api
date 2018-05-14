require_relative '../../rails_helper'

describe ComponentSerializer::ListComponentSerializer do
  let ( :heading ) { '/mps' }
  let ( :list_items ) { [1, 2, 3] }

  let ( :listcomponentserializer ) { described_class.new(heading, list_items) }
  context '#to_h' do
    it 'returns a hash containing the name and data' do
      expect(listcomponentserializer.to_h).to eq({:name=>"list-component", :data=>{:heading=>"/mps", :"list-items"=>[1, 2, 3]}})
    end
  end

end
