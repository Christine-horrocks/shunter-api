require 'rails_helper'

RSpec.describe PostcodesController, vcr: true do
  describe 'GET index' do
    before(:each) do
      allow(PageSerializer::PostcodesIndexPageSerializer).to receive(:new)
      get :index
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'calls the PostcodesIndexPageSerializer with the correct arguments' do
      expect(PageSerializer::PostcodesIndexPageSerializer).to have_received(:new).with(controller.params, nil)
    end
  end
end