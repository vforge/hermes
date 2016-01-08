class AddCacheToAds < ActiveRecord::Migration
  def change
    add_column :ads, :count_clicks, :integer, default: 0
    add_column :ads, :count_requests, :integer, default: 0
    add_column :ad_campaigns, :count_clicks, :integer, default: 0
    add_column :ad_campaigns, :count_requests, :integer, default: 0
  end
end
