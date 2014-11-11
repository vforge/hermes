require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  it "Goes to dashboard after successful login" do
    user = FactoryGirl.create(:user, password: 'password', password_confirmation: 'password')

    visit         join_path
    fill_in       "email",    with: user.email
    fill_in       "password", with: 'password'
    click_button  "Login"

    expect(page).to have_selector(".dashboard-home")
  end
end
