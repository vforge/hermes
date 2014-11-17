require 'rails_helper'

RSpec.describe "Session", type: :request do
  it "Goes to dashboard after successful login" do
    u = FactoryGirl.create(:user)

    visit         join_path
    fill_in       "email",    with: u.email
    fill_in       "password", with: 'password'
    click_button  "Login"

    expect(page).to have_selector(".dashboard-home")
  end

  it "Goes to login page after unsuccessful login" do
    u = FactoryGirl.create(:user)

    visit         join_path
    fill_in       "email",    with: u.email
    fill_in       "password", with: 'badpassword'
    click_button  "Login"

    expect(page).not_to have_selector(".dashboard-home")
  end
end
