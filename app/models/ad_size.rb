# == Schema Information
# Schema version: 20141116174002
#
# Table name: ad_sizes
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  classification :string(255)
#  width          :integer
#  height         :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class AdSize < ActiveRecord::Base
  enumerize :classification, in: [:primary, :secondary], scope: true, default: :secondary

  validates :name,            presence: true
  validates :classification,  presence: true
  validates :width,           presence: true, numericality: { only_integer: true, greater_than: 1 }
  validates :height,          presence: true, numericality: { only_integer: true, greater_than: 1 }

  def size
    "#{self.width}x#{self.height}"
  end

  def format_for_select
    primary_indicator = self.classification.primary? ? '*' : ''

    "#{self.name}#{primary_indicator} (#{self.size})"
  end

  def format_for_index
    primary_indicator = self.classification.primary? ? '*' : ''

    "#{self.size}<br>#{self.name}#{primary_indicator}".html_safe
  end
end
