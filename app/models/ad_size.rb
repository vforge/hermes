# == Schema Information
# Schema version: 20141116174002
#
# Table name: ad_sizes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  width      :integer
#  height     :integer
#  created_at :datetime
#  updated_at :datetime
#

class AdSize < ActiveRecord::Base
end
