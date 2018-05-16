require_relative '../../rails_helper'

describe ComponentSerializer::HeroComponentSerializer do
  let(:title) { 'Welcome to Parliament' }
  let(:additional_text) { 'Even more interesting information' }

  let(:hero_component_serializer) { described_class.new(title, additional_text) }

  context '#to_h' do
    it 'returns a hash containing the name and data' do
      expected = get_fixture('component_serializer/hero_component_serializer/fixture.yml')

      expect(hero_component_serializer.to_yaml).to eq expected
    end
  end
end
