class DashboardController < BaseController
  def home
    @modules = {}

    active_campaigns = AdCampaign.with_status(:active).to_a

    @modules[:ad_campaigns]   = active_campaigns.count
    # @modules[:today_requests] = '?'
    # @modules[:today_clicks]   = '?'
    @modules[:total_requests] = active_campaigns.sum(&:count_requests)
    @modules[:total_clicks]   = active_campaigns.sum(&:count_clicks)
  end
end
