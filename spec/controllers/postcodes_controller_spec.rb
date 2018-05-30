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

    it 'assigns @postcode_error and deletes session[:postcode_error] if lookup sets session[:postcode_error]' do
      post :lookup, params: { postcode: '', previous_controller: 'postcodes', previous_action: 'index' }

      get :index

      expect(assigns[:postcode_error]).to eq("We couldn't find the postcode you entered.")
      expect(session[:postcode_error]).to eq(nil)
    end
  end

  describe 'POST lookup' do
    context 'given a valid postcode' do
      before(:each) do
        post :lookup, params: { postcode: 'SW1A 2AA', previous_controller: 'postcodes', previous_action: 'index' }
      end

      it 'redirects to show' do
        expect(response).to redirect_to(postcode_path('SW1A-2AA'))
      end
    end

    context 'given a blank postcode' do
      before(:each) do
        post :lookup, params: { postcode: '', previous_controller: 'postcodes', previous_action: 'index' }
      end

      it 'assigns session[:postcode_error]' do
        expect(session[:postcode_error]).to eq("We couldn't find the postcode you entered.")
      end

      it 'redirects to postcodes index' do
        expect(response).to redirect_to(postcodes_path)
      end
    end
  end
end