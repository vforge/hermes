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

class User < ActiveRecord::Base
  has_secure_password

  enumerize :role,   in: [:user, :admin], scope: true, default: :user
  enumerize :locale, in: [:en, :pl], scope: true, default: :en

  validates :email, presence: true, email: true
end
