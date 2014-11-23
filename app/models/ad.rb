# == Schema Information
# Schema version: 20141116174002
#
# Table name: ads
#
#  id             :integer          not null, primary key
#  filename       :string(255)
#  ad_campaign_id :integer
#  href           :text
#  status         :string(255)
#  ad_size_id     :integer
#  visible        :boolean          default(TRUE)
#  count_requests :integer          default(0)
#  count_clicks   :integer          default(0)
#  created_at     :datetime
#  updated_at     :datetime
#
# Indexes
#
#  ad_s    (visible,status)
#  ad_sa   (visible,status,ad_campaign_id)
#  ad_sa2  (visible,status,ad_size_id)
#  ad_v    (visible)
#

class Ad < VisibleModel
  enumerize :status, in: [:active, :inactive], scope: true, default: :active

  validates :href,        presence: true
  validates :filename,    presence: true

  belongs_to :ad_campaign
  belongs_to :ad_size

  mount_uploader :filename, FileUploader
end
