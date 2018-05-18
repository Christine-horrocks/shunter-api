require_relative '../../rails_helper'

RSpec.describe PeopleController, vcr: true do
  describe 'GET show' do
    context 'with current MP' do
      before(:each) do
        get '/people/43RHonMf'
      end

      context 'with all the information present' do
        it 'renders expected JSON output' do
          expected_json = get_fixture('show', 'with_all_data')

          expect(JSON.parse(response.body).to_yaml).to eq(expected_json)
        end
      end
    end

    context 'with a former MP' do
      before(:each) do
        get '/people/qkVSY7jb'
      end

      context 'with all the information present' do
        it 'renders expected JSON output' do
          expected_json = get_fixture('show', 'former_mp')

          expect(JSON.parse(response.body).to_yaml).to eq(expected_json)
        end
      end
    end

    context 'with a current Lord' do
      before(:each) do
        get '/people/0G6VnY9o'
      end

      context 'with all the information present' do
        it 'renders expected JSON output' do
          expected_json = get_fixture('show', 'current_lord')

          expect(JSON.parse(response.body).to_yaml).to eq(expected_json)
        end
      end
    end

    context 'with a former Lord' do
      before(:each) do
        get '/people/c2Q5Jyop'
      end

      context 'with all the information present' do
        it 'renders expected JSON output' do
          expected_json = get_fixture('show', 'former_lord')

          expect(JSON.parse(response.body).to_yaml).to eq(expected_json)
        end
      end
    end
  end
end
