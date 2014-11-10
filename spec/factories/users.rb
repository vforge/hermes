# == Schema Information
# Schema version: 20141110195125
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  password_digest :string(255)
#  role            :string(255)
#  settings        :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

FactoryGirl.define do
  factory :user do
    email "MyString"
password_digest "MyString"
role "MyString"
settings "MyString"
  end

end
