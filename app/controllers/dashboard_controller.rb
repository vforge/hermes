class DashboardController < BaseController
  def home
    @modules = {}

    @modules[:ad_campaigns]   = AdCampaign.with_status(:active).count
    @modules[:today_requests] = '?'
    @modules[:today_clicks]   = '?'
  end
end
