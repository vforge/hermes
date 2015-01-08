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
  has_attached_file :file, styles: { thumb: ["32x32#", :jpg] }

  scope :randomize, -> { with_status(:active).order_by_rand }

  enumerize :status, in: [:active, :inactive], scope: true, default: :active

  validates :href, presence: true
  validates_attachment :file, presence: true, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  belongs_to :ad_campaign
  belongs_to :ad_size


  def resource_url
    file.url
  end

  def self.search(params)
    results = Ad.randomize
    results = results.includes(:ad_size).where('ad_sizes.width >= ?', params[:mw]).references(:ad_size) if params[:mw].present?
    results = results.includes(:ad_size).where('ad_sizes.width <= ?', params[:xw]).references(:ad_size) if params[:xw].present?
    results = results.includes(:ad_size).where('ad_sizes.height >= ?', params[:mh]).references(:ad_size) if params[:mh].present?
    results = results.includes(:ad_size).where('ad_sizes.height <= ?', params[:xh]).references(:ad_size) if params[:xh].present?
    results = results.includes(:ad_size).where('ad_sizes.name = ?', params[:n]).references(:ad_size) if params[:n].present?

    results
  end
end
