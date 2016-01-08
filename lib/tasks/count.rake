desc 'Fill cache for Ads and AdCampaigns'

task 'count:ads' => :environment do
  Ad.all.each do |ad|
    clicks = Stat.ad :click, ad
    requests = Stat.ad :impression, ad

    ad.count_clicks = clicks
    ad.count_requests = requests
    ad.save

    puts "Ad #{ad.id} -> #{clicks}/#{requests}\n"
  end

  AdCampaign.all.each do |campaign|
    clicks = Stat.campaign :click, campaign
    requests = Stat.campaign :impression, campaign

    campaign.count_clicks = clicks
    campaign.count_requests = requests
    campaign.save

    puts "AdCampaign #{campaign.id} -> #{clicks}/#{requests}\n"
  end
end
