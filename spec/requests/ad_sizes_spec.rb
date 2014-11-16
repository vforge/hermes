require 'rails_helper'

RSpec.describe "AdSizes", type: :request do
  before(:each) do
    login_user
  end

  describe "GET ad_sizes_path" do
    it "responds successfully with an HTTP 200 status code" do
      get ad_sizes_path

      expect(response).to be_success
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET ad_size_path" do
    it "responds successfully with an HTTP 200 status code" do
      get ad_size_path(id: 1)

      expect(response).to be_success
      expect(response).to have_http_status(:success)
    end
  end
end
