desc 'Fill cache for Ads and AdCampaigns'

task 'count:ads' => :environment do
  Ad.all.each do |ad|
    clicks = Stat.ad :click, ad
    impressions = Stat.ad :impression, ad

    puts "Ad #{ad.id} -> #{clicks}/#{impressions}\n"
  end

  AdCampaign.all.each do |campaign|
    clicks = Stat.campaign :click, campaign
    impressions = Stat.campaign :impression, campaign

    puts "AdCampaign #{campaign.id} -> #{clicks}/#{impressions}\n"
  end
end
