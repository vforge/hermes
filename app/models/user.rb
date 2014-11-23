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

class User < VisibleModel
  has_secure_password

  enumerize :role,   in: [:user, :admin], scope: true, default: :user
  enumerize :locale, in: [:en, :pl], scope: true, default: :en

  validates :email, presence: true, email: true
end
