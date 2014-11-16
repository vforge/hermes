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

FactoryGirl.define do
  factory :ad_size do
    name    { Faker::Hacker.adjective }
    width   { Faker::Number.number(3) }
    height  { Faker::Number.number(3) }
  end
end
