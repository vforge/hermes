require 'rails_helper'

RSpec.describe "Ads", type: :request do
  before(:each) do
    login_user
  end

  describe "GET ads_path" do
    it "responds successfully with an HTTP 200 status code" do
      get ads_path

      expect(response).to be_success
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET ad_path" do
    it "responds successfully with an HTTP 200 status code" do
      get ad_path(id: 1)

      expect(response).to be_success
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET new_ad_path" do
    it "responds successfully with an HTTP 200 status code" do
      get new_ad_path

      expect(response).to be_success
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET edit_ad_path" do
    it "responds successfully with an HTTP 200 status code" do
      get edit_ad_path(id: 1)

      expect(response).to be_success
      expect(response).to have_http_status(:success)
    end
  end
end
