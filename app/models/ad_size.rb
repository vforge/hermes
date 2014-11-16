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
  enumerize :classification, in: [:primary, :secondary], default: :secondary

  validates :name,            presence: true
  validates :classification,  presence: true
  validates :width,           presence: true, numericality: { only_integer: true, greater_than: 1 }
  validates :height,          presence: true, numericality: { only_integer: true, greater_than: 1 }
end
