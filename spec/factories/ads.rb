# == Schema Information
# Schema version: 20141116174002
#
# Table name: ads
#
#  id             :integer          not null, primary key
#  filename       :string(255)
#  ad_campaign_id :integer
#  status         :string(255)
#  ad_size_id     :integer
#  created_at     :datetime
#  updated_at     :datetime
#
# Indexes
#
#  ad_s    (status)
#  ad_sa   (status,ad_campaign_id)
#  ad_sa2  (status,ad_size_id)
#

FactoryGirl.define do
  factory :ad do
    ad_campaign

    filename    { Faker::Avatar.image }
    status      :active

    trait :inactive do
      status :inactive
    end
  end
end
