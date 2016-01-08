# == Schema Information
# Schema version: 20150203213425
#
# Table name: ads
#
#  id             :integer          not null, primary key
#  filename       :string(255)
#  ad_campaign_id :integer
#  href           :text
#  status         :string(255)
#  ad_size_id     :integer
#  deleted_at     :datetime
#  created_at     :datetime
#  updated_at     :datetime
#
# Indexes
#
#  ad_s    (deleted_at,status)
#  ad_sa   (deleted_at,status,ad_campaign_id)
#  ad_sa2  (deleted_at,status,ad_size_id)
#  ad_x    (deleted_at)
#

class Ad < ActiveRecord::Base
  scope :active, -> { not_deleted.with_status(:active).where('ad_campaign_id IN (?)', AdCampaign.active_ids) }
  scope :randomized, -> { active.order_by_rand }

  enumerize :status, in: [:active, :inactive], scope: true, default: :inactive

  validates :href,        presence: true
  validates :filename,    presence: true

  belongs_to :ad_campaign
  belongs_to :ad_size

  mount_uploader :filename, FileUploader

  def resource_url
    filename.url
  end

  # def count_clicks
  #   Stat.ad :click, self
  # end
  #
  # def count_requests
  #   Stat.ad :impression, self
  # end

  def self.search(params)
    results = Ad.randomized

    results = results.includes(:ad_size).where('ad_sizes.width >= ?',   params[:wm]).references(:ad_size) if params[:wm].present?
    results = results.includes(:ad_size).where('ad_sizes.width <= ?',   params[:wx]).references(:ad_size) if params[:wx].present?
    results = results.includes(:ad_size).where('ad_sizes.height >= ?',  params[:hm]).references(:ad_size) if params[:hm].present?
    results = results.includes(:ad_size).where('ad_sizes.height <= ?',  params[:hx]).references(:ad_size) if params[:hx].present?
    results = results.includes(:ad_size).where('ad_sizes.name = ?',     params[:n]).references(:ad_size)  if params[:n].present?

    results
  end
end
