require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  it "Goes to dashboard after successful login" do
    u = FactoryGirl.create(:user)

    visit         join_path
    fill_in       "email",    with: u.email
    fill_in       "password", with: 'password'
    click_button  "Login"

    expect(page).to have_selector(".dashboard-home")
  end
end
