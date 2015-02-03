# == Schema Information
# Schema version: 20150203213425
#
# Table name: stats
#
#  id             :integer          not null, primary key
#  classification :string(255)
#  uuid           :string(255)
#  ad_id          :integer
#  created_at     :datetime
#  updated_at     :datetime
#
# Indexes
#
#  st_c  (classification)
#

class Stat < ActiveRecord::Base
  enumerize :classification, in: [:impression, :click], scope: true

  belongs_to :ad

  def self.record(classification, ad, uuid)
    Stat.create(classification: classification, uuid: uuid, ad_id: ad.id)
  end

  def self.campaign(classification, ad_campaign)
    ad_campaign.ads.map { |ad| Stat.with_classification(classification).where(ad_id: ad.id).count }.inject(:+)
  end

  def self.ad(classification, ad)
    Stat.with_classification(classification).where(ad_id: ad.id).count
  end
end
