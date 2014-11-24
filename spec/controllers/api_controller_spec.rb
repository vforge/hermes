require 'rails_helper'

RSpec.describe ApiController, :type => :controller do

  describe "GET get" do
    it "returns http success" do
      get :get
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET click" do
    it "returns http success" do
      get :click
      expect(response).to have_http_status(:success)
    end
  end

end
