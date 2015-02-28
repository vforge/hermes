# == Schema Information
# Schema version: 20150203213425
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
#  deleted_at  :datetime
#  created_at  :datetime
#  updated_at  :datetime
#
# Indexes
#
#  ac_c    (deleted_at,company)
#  ac_s    (deleted_at,status)
#  ac_sse  (deleted_at,status,starting_at,ending_at)
#  ac_x    (deleted_at)
#

FactoryGirl.define do
  factory :ad_campaign do
    name        { Faker::Company.catch_phrase }
    company     { Faker::Company.name }
    starting_at { Faker::Date.backward(30) }
    ending_at   { Faker::Date.forward(30) }
    target      '{}'
    status      :active

    trait :inactive do
      status  :inactive
    end
  end
end
