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
  scope :randomize, -> { with_status(:active).order_by_rand }

  enumerize :status, in: [:active, :inactive], scope: true, default: :active

  validates :href,        presence: true
  validates :filename,    presence: true

  belongs_to :ad_campaign
  belongs_to :ad_size

  mount_uploader :filename, FileUploader

  def resource_url
    self.filename.url
  end

  def self.search params
    results = Ad.randomize

    if params[:mw].present?
      results = results.includes(:ad_size).where('ad_sizes.width >= ?', params[:mw]).references(:ad_size)
    end

    if params[:xw].present?
      results = results.includes(:ad_size).where('ad_sizes.width <= ?', params[:xw]).references(:ad_size)
    end

    if params[:mh].present?
      results = results.includes(:ad_size).where('ad_sizes.height >= ?', params[:mh]).references(:ad_size)
    end

    if params[:xh].present?
      results = results.includes(:ad_size).where('ad_sizes.height <= ?', params[:xh]).references(:ad_size)
    end

    if params[:n].present?
      results = results.includes(:ad_size).where('ad_sizes.name = ?', params[:n]).references(:ad_size)
    end

    results
  end
end
