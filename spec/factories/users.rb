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
#  visible         :boolean          default(TRUE)
#  created_at      :datetime
#  updated_at      :datetime
#
# Indexes
#
#  us_ep  (visible,email,password_digest)
#  us_r   (visible,role)
#  us_v   (visible)
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
