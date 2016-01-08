# == Schema Information
# Schema version: 20150203213425
#
# Table name: ad_campaigns
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  company     :string(255)
#  starting_at :datetime
#  ending_at   :datetime
#  target      :string(255)
#  status      :string(255)
#  deleted_at  :datetime
#  created_at  :datetime
#  updated_at  :datetime
#
# Indexes
#
#  ac_c    (deleted_at,company)
#  ac_s    (deleted_at,status)
#  ac_sse  (deleted_at,status,starting_at,ending_at)
#  ac_x    (deleted_at)
#

class AdCampaign < ActiveRecord::Base
  validates :name,        presence: true
  validates :company,     presence: true
  validates :starting_at, presence: true
  validates :ending_at,   presence: true

  has_many  :ads

  def self.active_ids
    not_deleted.pluck(:id)
  end

  # def count_clicks
  #   Stat.campaign :click, self
  # end
  #
  # def count_requests
  #   Stat.campaign :impression, self
  # end

  def count_active_ads
    ads.with_status(:active).count
  end

  def count_inactive_ads
    ads.with_status(:inactive).count
  end
end
