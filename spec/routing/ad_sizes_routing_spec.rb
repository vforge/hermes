require "rails_helper"

RSpec.describe TargetParamsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/ad_sizes").to route_to("ad_sizes#index")
    end

    it "not routes to #new" do
      expect(get: "/ad_sizes/new").not_to be_routable
    end

    it "routes to #show" do
      expect(get: "/ad_sizes/1").to route_to("ad_sizes#show", id: "1")
    end

    it "not routes to #edit" do
      expect(get: "/ad_sizes/1/edit").not_to be_routable
    end

    it "not routes to #create" do
      expect(post: "/ad_sizes").not_to be_routable
    end

    it "not routes to #update" do
      expect(put: "/ad_sizes/1").not_to be_routable
    end

    it "not routes to #destroy" do
      expect(delete: "/ad_sizes/1").not_to be_routable
    end
  end
end
