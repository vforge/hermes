require "rails_helper"

RSpec.describe RedirectController, type: :routing do
  describe "routing" do
    it "routes to root" do
      expect(get: root_path).to route_to("redirect#root")
    end
  end
end
