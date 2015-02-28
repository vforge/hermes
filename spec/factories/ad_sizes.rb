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

FactoryGirl.define do
  factory :ad_size do
    name    { Faker::Hacker.adjective }
    width   { Faker::Number.number(3) }
    height  { Faker::Number.number(3) }
    classification :secondary

    trait :primary do
      classification :primary
    end
  end
end
