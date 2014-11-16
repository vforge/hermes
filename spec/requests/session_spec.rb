require 'rails_helper'

RSpec.describe "Session", type: :request do

  describe "GET login_path" do
    it "responds successfully with an HTTP 200 status code" do
      logout

      get login_path

      expect(response).to be_success
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET logout_path" do
    it "responds successfully with an HTTP 200 status code" do
      login

      get logout_path

      expect(response).to be_success
      expect(response).to have_http_status(:success)
    end
  end
end
