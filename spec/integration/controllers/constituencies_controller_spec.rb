require_relative '../../rails_helper'

RSpec.describe ConstituenciesController, vcr: true do
  describe 'GET show' do
    context 'with a constituency that exists' do
      it 'renders expected JSON output' do
        get '/constituencies/yyocmekJ'

        expected = get_fixture('show', 'with_all_data')

        expect(JSON.parse(response.body).to_yaml).to eq(expected)
      end
    end
  end

  describe 'GET map' do
    context 'with a constituency that exists' do
      it 'renders expected JSON output' do
        get '/constituencies/yyocmekJ/map.json'

        expected = get_fixture('map', 'map')

        expect(JSON.parse(response.body).to_yaml).to eq(expected)
      end
    end
  end

  describe 'GET index' do
    context 'for all constituencies' do
      it 'renders expected JSON output' do
        get '/constituencies'

        expected = get_fixture('index', 'index')

        expect(JSON.parse(response.body).to_yaml).to eq(expected)
      end
    end
  end

  describe 'GET letters' do
    context 'for constituencies beginning with A' do
      it 'renders expected JSON output' do
        get '/constituencies/a-z/y'

        expected = get_fixture('letters', 'y')

        expect(JSON.parse(response.body).to_yaml).to eq(expected)
      end
    end
  end
end
