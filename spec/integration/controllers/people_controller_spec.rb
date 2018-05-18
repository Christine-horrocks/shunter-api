require_relative '../../rails_helper'

RSpec.describe PeopleController, vcr: true do
  describe 'GET show' do
    context 'with current MP' do
      it 'renders expected JSON output' do
        get '/people/43RHonMf'

        expected_json = get_fixture('show', 'with_all_data')

        expect(JSON.parse(response.body).to_yaml).to eq(expected_json)
      end
    end

    context 'with former MP' do
      it 'renders expected JSON output' do
        get '/people/qkVSY7jb'

        expected_json = get_fixture('show', 'former_mp')

        expect(JSON.parse(response.body).to_yaml).to eq(expected_json)
      end
    end

    context 'with current Lord' do
      it 'renders expected JSON output' do
        get '/people/0G6VnY9o'

        expected_json = get_fixture('show', 'current_lord')

        expect(JSON.parse(response.body).to_yaml).to eq(expected_json)
      end
    end

    context 'with former Lord' do
      it 'renders expected JSON output' do
        get '/people/c2Q5Jyop'

        expected_json = get_fixture('show', 'former_lord')

        expect(JSON.parse(response.body).to_yaml).to eq(expected_json)
      end
    end
  end
end
