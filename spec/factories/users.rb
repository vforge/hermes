# == Schema Information
# Schema version: 20141116174002
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  password_digest :string(255)
#  role            :string(255)
#  locale          :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#
# Indexes
#
#  us_ep  (email,password_digest)
#  us_r   (role)
#

FactoryGirl.define do
  factory :user do
    email                 { Faker::Internet.email }
    password              "MyString"
    password_confirmation "MyString"
    role                  :user

    trait :normal do
      role :user
    end

    trait :admin do
      role :admin
    end
  end
end
