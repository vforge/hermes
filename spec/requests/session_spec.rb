require 'rails_helper'

RSpec.describe "Session", type: :request do
  describe "GET join_path" do
    it "responds successfully with an HTTP 200 status code" do
      get join_path

      expect(response).to be_success
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET logout_path" do
    it "responds successfully with an HTTP 200 status code" do
      login_user

      get logout_path

      expect(response).to have_http_status(:redirect)
    end
  end
end
