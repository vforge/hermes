# == Schema Information
# Schema version: 20150203213425
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  password_digest :string(255)
#  role            :string(255)
#  locale          :string(255)
#  deleted_at      :datetime
#  created_at      :datetime
#  updated_at      :datetime
#
# Indexes
#
#  us_ep  (deleted_at,email,password_digest)
#  us_r   (deleted_at,role)
#  us_x   (deleted_at)
#

FactoryGirl.define do
  factory :user do
    email                 { Faker::Internet.email }
    password              'password'
    password_confirmation 'password'
    role                  :user

    trait :admin do
      role :admin
    end
  end
end
