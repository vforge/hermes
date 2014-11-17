require "rails_helper"

RSpec.describe AdSizesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/ad_sizes").to route_to("ad_sizes#index")
    end

    it "routes to #show" do
      expect(get: "/ad_sizes/1").to route_to("ad_sizes#show", id: "1")
    end
  end
end
