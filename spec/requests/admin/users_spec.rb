require 'rails_helper'

RSpec.describe "Admin::Users", type: :request do
  before(:each) do
    admin = FactoryGirl.create(:user, :admin, password: 'pw', password_confirmation: 'pw')

    post join_path(email: admin.email, password: 'pw')
  end

  describe "GET admin_users_path" do
    it "responds successfully with an HTTP 200 status code" do
      get admin_users_path

      expect(response).to be_success
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET admin_user_path" do
    it "responds successfully with an HTTP 200 status code" do
      get admin_user_path(id: 1)

      expect(response).to be_success
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET new_admin_user_path" do
    it "responds successfully with an HTTP 200 status code" do
      get new_admin_user_path

      expect(response).to be_success
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET edit_admin_user_path" do
    it "responds successfully with an HTTP 200 status code" do
      get edit_admin_user_path(id: 1)

      expect(response).to be_success
      expect(response).to have_http_status(:success)
    end
  end
end
