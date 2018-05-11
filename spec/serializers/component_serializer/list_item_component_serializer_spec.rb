require_relative '../../rails_helper'

describe ComponentSerializer::ListItemComponentSerializer do
  let ( :link ) { '/mps' }
  let ( :link_text ) { 'find MPs here' }
  let ( :additional_text ) { 'Even more MPs' }

  let ( :listitemcomponentserializer ) { described_class.new(link, link_text, additional_text) }
  context '#to_h' do
    it 'returns a hash containing the name and data' do
      expect(listitemcomponentserializer.to_h).to eq({:link=>"/mps", :"link-text"=>"find MPs here", :"additional-text"=>["Even more MPs"]})
    end
  end

end
