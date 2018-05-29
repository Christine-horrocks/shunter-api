require_relative '../../rails_helper'

RSpec.describe PeopleController, vcr: true do
  describe 'GET index' do
    it 'renders expected JSON output' do
      get '/postcodes'

      expected = get_fixture('index', 'index')

      expect(JSON.parse(response.body).to_yaml).to eq(expected)
    end
  end

  describe 'GET show' do
    context 'with all data' do
      it 'renders expected JSON output' do
        get '/postcodes/w5-2se'

        expected = get_fixture('show', 'with_all_data')

        expect(JSON.parse(response.body).to_yaml).to eq(expected)
      end
    end

    context 'if image_id is placeholder' do
      it 'renders expected JSON output' do
        get '/postcodes/eh11-2rq'

        expected = get_fixture('show', 'placeholder_image_id')

        expect(JSON.parse(response.body).to_yaml).to eq(expected)
      end
    end
  end
end
