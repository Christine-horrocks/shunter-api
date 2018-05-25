require_relative '../../rails_helper'

RSpec.describe HomeController, vcr: true do
  describe 'GET index' do
    context 'navigating to the home page' do
        before(:each) do
          get '/'
        end

      context 'with all the information present' do
        it 'renders expected JSON output' do
          expected_json = get_fixture('index', 'home_page')

          expect(JSON.parse(response.body).to_yaml).to eq(expected_json)
        end
      end
    end
  end
end
