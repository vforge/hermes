# == Schema Information
# Schema version: 20150203213425
#
# Table name: ad_sizes
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  classification :string(255)
#  width          :integer
#  height         :integer
#  status         :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#
# Indexes
#
#  ad_sizes_s  (status)
#

class AdSize < ActiveRecord::Base
  enumerize :classification,  in: [:primary, :secondary], scope: true, default: :secondary
  enumerize :status,          in: [:active, :inactive],   scope: true, default: :active

  validates :name,            presence: true
  validates :width,           presence: true, numericality: { only_integer: true, greater_than: 1 }
  validates :height,          presence: true, numericality: { only_integer: true, greater_than: 1 }

  def size
    "#{width}x#{height}"
  end

  def format_for_select
    primary_indicator = classification.primary? ? '*' : ''

    "#{name}#{primary_indicator} (#{size})"
  end

  def format_for_index
    primary_indicator = classification.primary? ? '*' : ''

    "#{size}<br>#{name}#{primary_indicator}".html_safe
  end
end
