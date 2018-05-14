require_relative '../../rails_helper'

RSpec.describe HomeController, vcr: true do
  describe 'GET index' do

    context 'navigating to the home page' do
        before(:each) do
          get '/'
        end

      context 'with all the information present' do
        it 'renders expected JSON output' do
          expected_json = get_fixture('home_controller/index/home_page.json')

          expect(JSON.parse(response.body)).to eq(JSON.parse(expected_json))
          end
        end
      end
    end
end
