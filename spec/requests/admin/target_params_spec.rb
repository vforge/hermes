require 'rails_helper'

RSpec.describe "Admin::TargetParamSizes", type: :request do
  before(:each) do
    login_admin

    @target_param = FactoryGirl.create(:target_param)
  end

  describe "GET admin_target_params_path" do
    it "responds successfully with an HTTP 200 status code" do
      get admin_target_params_path

      expect(response).to be_success
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET admin_target_param_path" do
    it "responds successfully with an HTTP 200 status code" do
      get admin_target_param_path(id: 1)

      expect(response).to be_success
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET new_admin_target_param_path" do
    it "responds successfully with an HTTP 200 status code" do
      get new_admin_target_param_path

      expect(response).to be_success
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET edit_admin_target_param_path" do
    it "responds successfully with an HTTP 200 status code" do
      get edit_admin_target_param_path(id: 1)

      expect(response).to be_success
      expect(response).to have_http_status(:success)
    end
  end
end
