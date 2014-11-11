# == Schema Information
# Schema version: 20141110195125
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

class User < ActiveRecord::Base
  has_secure_password

  enumerize :role,   in: [:user, :admin], default: :user
  enumerize :locale, in: [:en, :pl],      default: :en

end
