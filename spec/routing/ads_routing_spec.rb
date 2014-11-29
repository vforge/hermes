require 'rails_helper'

RSpec.describe AdsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/ad_campaigns/10/ads').to route_to('ads#index', ad_campaign_id: '10')
    end

    it 'routes to #new' do
      expect(get: '/ad_campaigns/10/ads/new').to route_to('ads#new', ad_campaign_id: '10')
    end

    it 'routes to #show' do
      expect(get: '/ad_campaigns/10/ads/1').to route_to('ads#show', ad_campaign_id: '10', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/ad_campaigns/10/ads/1/edit').to route_to('ads#edit', ad_campaign_id: '10', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/ad_campaigns/10/ads').to route_to('ads#create', ad_campaign_id: '10')
    end

    it 'routes to #update' do
      expect(put: '/ad_campaigns/10/ads/1').to route_to('ads#update', ad_campaign_id: '10', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/ad_campaigns/10/ads/1').to route_to('ads#destroy', ad_campaign_id: '10', id: '1')
    end
  end
end
