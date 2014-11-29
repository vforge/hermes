require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  describe 'GET home' do
    before do
      login FactoryGirl.create(:user)

      get :home
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      expect(response).to render_template(:home)
      expect(response).to render_template('home')
      expect(response).to render_template('dashboard/home')
    end
  end
end
