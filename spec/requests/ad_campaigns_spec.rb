require 'rails_helper'

RSpec.describe 'AdCampaigns', type: :request do
  before(:each) do
    login_user

    @ad_campaign = FactoryGirl.create(:ad_campaign)
  end

  describe 'GET ad_campaigns_path' do
    it 'responds successfully with an HTTP 200 status code' do
      get ad_campaigns_path

      expect(response).to be_success
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET ad_campaign_path' do
    it 'responds successfully with an HTTP 200 status code' do
      get ad_campaign_path(id: 1)

      expect(response).to be_success
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET new_ad_campaign_path' do
    it 'responds successfully with an HTTP 200 status code' do
      get new_ad_campaign_path

      expect(response).to be_success
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET edit_ad_campaign_path' do
    it 'responds successfully with an HTTP 200 status code' do
      get edit_ad_campaign_path(id: 1)

      expect(response).to be_success
      expect(response).to have_http_status(:success)
    end
  end
end
