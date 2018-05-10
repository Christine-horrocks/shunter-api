
require_relative '../rails_helper'

RSpec.describe HomeController, vcr: true do
  describe 'GET index' do
    before(:each) do
      allow(PageSerializer::HomePageSerializer).to receive(:new)
      get :index
    end

    it 'should have a response with status 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'calls the HomePageSerializer' do
          expect(PageSerializer::HomePageSerializer).to have_received(:new)
      end
  end
end
