require 'rails_helper'

RSpec.describe "Admin::AdSizes", type: :request do
  before(:each) do
    login_admin
  end

  describe "GET admin_ad_sizes_path" do
    it "responds successfully with an HTTP 200 status code" do
      get admin_ad_sizes_path

      expect(response).to be_success
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET admin_ad_size_path" do
    it "responds successfully with an HTTP 200 status code" do
      get admin_ad_size_path(id: 1)

      expect(response).to be_success
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET new_admin_ad_size_path" do
    it "responds successfully with an HTTP 200 status code" do
      get new_admin_ad_size_path

      expect(response).to be_success
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET edit_admin_ad_size_path" do
    it "responds successfully with an HTTP 200 status code" do
      get edit_admin_ad_size_path(id: 1)

      expect(response).to be_success
      expect(response).to have_http_status(:success)
    end
  end
end
