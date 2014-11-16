require "rails_helper"

RSpec.describe Admin::TargetParamsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/admin/target_params").to route_to("admin/target_params#index")
    end

    it "routes to #new" do
      expect(get: "/admin/target_params/new").to route_to("admin/target_params#new")
    end

    it "routes to #show" do
      expect(get: "/admin/target_params/1").to route_to("admin/target_params#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/admin/target_params/1/edit").to route_to("admin/target_params#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/admin/target_params").to route_to("admin/target_params#create")
    end

    it "routes to #update" do
      expect(put: "/admin/target_params/1").to route_to("admin/target_params#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/admin/target_params/1").to route_to("admin/target_params#destroy", id: "1")
    end
  end
end
