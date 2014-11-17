require 'rails_helper'

RSpec.describe "Redirect", type: :request do
  it "redirects to dashboard for logged users" do
    login_user

    get_via_redirect root_path

    expect(response).to render_template(:home)
  end

  it "redirects to dashboard for not logged users" do
    get_via_redirect root_path

    expect(response).to render_template(:new)
  end
end
