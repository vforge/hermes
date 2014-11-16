require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do
  before(:each) do
    login FactoryGirl.create(:user, :admin)
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

  describe "GET new" do
    before do
      get :new
    end

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status(:success)
    end
  
    it "renders the new template" do
      expect(response).to render_template(:new)
      expect(response).to render_template("new")
      expect(response).to render_template("admin/users/new")
    end
  end
  
  describe "GET show" do
    before do
      get :show, id: 1
    end

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status(:success)
    end
  
    it "renders the show template" do
      expect(response).to render_template(:show)
      expect(response).to render_template("show")
      expect(response).to render_template("admin/users/show")
    end
  end
  
  describe "GET edit" do
    before do
      get :edit, id: 1
    end

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status(:success)
    end
  
    it "renders the edit template" do
      expect(response).to render_template(:edit)
      expect(response).to render_template("edit")
      expect(response).to render_template("admin/users/edit")
    end
  end

end
