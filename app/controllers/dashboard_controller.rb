class DashboardController < BaseController
  def home
    @modules = {}

    active_campaigns = AdCampaign.not_deleted.to_a

    @modules[:active_ads]   = active_campaigns.sum(&:count_active_ads)
    # @modules[:today_requests] = '?'
    # @modules[:today_clicks]   = '?'
    @modules[:total_requests] = active_campaigns.sum(&:count_requests)
    @modules[:total_clicks]   = active_campaigns.sum(&:count_clicks)
  end
end
