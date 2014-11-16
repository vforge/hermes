require "rails_helper"

RSpec.describe SessionController, type: :routing do
  describe "routing" do
    it "routes to join dialog" do
      expect(get: join_path).to route_to("session#new")
    end

    it "routes to join" do
      expect(post: join_path).to route_to("session#create")
    end

    it "routes to logout" do
      expect(get: logout_path).to route_to("session#destroy")
    end
  end
end
