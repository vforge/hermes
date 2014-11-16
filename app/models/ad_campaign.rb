# == Schema Information
# Schema version: 20141116174002
#
# Table name: ad_campaigns
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  company     :string(255)
#  starting_at :datetime
#  ending_at   :datetime
#  target      :string(255)
#  status      :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#
# Indexes
#
#  ac_c    (company)
#  ac_s    (status)
#  ac_sse  (status,starting_at,ending_at)
#

class AdCampaign < ActiveRecord::Base
  enumerize :status, in: [:active, :inactive], default: :active
end
