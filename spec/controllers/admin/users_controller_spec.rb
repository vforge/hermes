require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do
  before(:each) do
    request.session[:user_id] = FactoryGirl.create(:user, :admin).id
  end

  describe "GET index" do
    before do
      get :index
    end

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      expect(response).to render_template(:index)
      expect(response).to render_template("index")
      expect(response).to render_template("admin/users/index")
    end
  end

  # describe "GET new" do
  #   it "returns http success" do
  #     get :new
  #     expect(response).to be_success
  #     expect(response).to have_http_status(:success)
  #   end
  #
  #   it "renders the new template" do
  #     get :index
  #     expect(response).to render_template("new")
  #   end
  # end
  #
  # describe "GET show" do
  #   it "returns http success" do
  #     get :show, id: 1
  #     expect(response).to be_success
  #     expect(response).to have_http_status(:success)
  #   end
  #
  #   it "renders the show template" do
  #     get :show, id: 1
  #     expect(response).to render_template("show")
  #   end
  # end
  #
  # describe "GET edit" do
  #   it "returns http success" do
  #     get :edit, id: 1
  #     expect(response).to be_success
  #     expect(response).to have_http_status(:success)
  #   end
  #
  #   it "renders the edit template" do
  #     get :edit, id: 1
  #     expect(response).to render_template("edit")
  #   end
  # end

end
