require 'rails_helper'

RSpec.describe SessionController, type: :controller do
  describe 'GET new' do
    before do
      get :new
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      expect(response).to render_template(:new)
      expect(response).to render_template('new')
      expect(response).to render_template('session/new')
    end
  end
end
