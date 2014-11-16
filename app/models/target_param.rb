# == Schema Information
# Schema version: 20141116174002
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
end
