require 'rails_helper'

RSpec.describe 'Ads', type: :request do
  let(:ad) { FactoryGirl.create(:ad) }

  before(:each) do
    login_user
  end

  describe 'GET ad_campaign_ads_path' do
    it 'responds successfully with an HTTP 200 status code' do
      get ad_campaign_ads_path(ad.ad_campaign)

      expect(response).to be_success
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET ad_campaign_ad_path' do
    it 'responds successfully with an HTTP 200 status code' do
      get ad_campaign_ad_path(ad.ad_campaign, ad)

      expect(response).to be_success
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET new_ad_campaign_ad_path' do
    it 'responds successfully with an HTTP 200 status code' do
      get new_ad_campaign_ad_path(ad.ad_campaign)

      expect(response).to be_success
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET edit_ad_campaign_ad_path' do
    it 'responds successfully with an HTTP 200 status code' do
      get edit_ad_campaign_ad_path(ad.ad_campaign, ad)

      expect(response).to be_success
      expect(response).to have_http_status(:success)
    end
  end
end
