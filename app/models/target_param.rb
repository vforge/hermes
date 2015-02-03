# == Schema Information
# Schema version: 20150203213425
#
# Table name: target_params
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  category        :string(255)
#  possible_values :string(255)
#  default         :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#
# Indexes
#
#  tp_c  (category)
#

class TargetParam < ActiveRecord::Base
  validates :name,            presence: true
  validates :category,        presence: true
  validates :possible_values, presence: true
  validates :default,         presence: true, allow_blank: true
end
