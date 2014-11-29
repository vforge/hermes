# == Schema Information
# Schema version: 20141116174002
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
#  visible     :boolean          default(TRUE)
#  created_at  :datetime
#  updated_at  :datetime
#
# Indexes
#
#  ac_c    (visible,company)
#  ac_s    (visible,status)
#  ac_sse  (visible,status,starting_at,ending_at)
#  ac_v    (visible)
#

class AdCampaign < VisibleModel
  enumerize :status, in: [:active, :inactive], scope: true, default: :active

  validates :name,        presence: true
  validates :company,     presence: true
  validates :starting_at, presence: true
  validates :ending_at,   presence: true

  has_many  :ads

  def count_clicks
    ads.sum(:count_clicks)
  end

  def count_requests
    ads.sum(:count_requests)
  end
end
