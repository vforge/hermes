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
#  visible        :boolean          default(TRUE)
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
  scope :randomize, -> { with_status(:active).order_by_rand }

  enumerize :status, in: [:active, :inactive], scope: true, default: :active

  validates :href,        presence: true
  validates :filename,    presence: true

  belongs_to :ad_campaign
  belongs_to :ad_size

  mount_uploader :filename, FileUploader

  def resource_url
    filename.url
  end

  def count_clicks
    Stat.ad :click, self
  end

  def count_requests
    Stat.ad :impression, self
  end

  def self.search(params)
    results = Ad.randomize

    results = results.includes(:ad_size).where('ad_sizes.width >= ?', params[:wm]).references(:ad_size) if params[:wm].present?
    results = results.includes(:ad_size).where('ad_sizes.width <= ?', params[:wx]).references(:ad_size) if params[:wx].present?
    results = results.includes(:ad_size).where('ad_sizes.height >= ?', params[:hm]).references(:ad_size) if params[:hm].present?
    results = results.includes(:ad_size).where('ad_sizes.height <= ?', params[:hx]).references(:ad_size) if params[:hx].present?
    results = results.includes(:ad_size).where('ad_sizes.name = ?', params[:n]).references(:ad_size) if params[:n].present?

    results
  end
end
