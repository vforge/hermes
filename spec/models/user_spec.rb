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

require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to enumerize(:role).in(:user, :admin) }

  it "has a valid factory" do
    expect(FactoryGirl.build_stubbed(:user)).to         be_valid
    expect(FactoryGirl.build_stubbed(:user, :admin)).to be_valid
  end

  it "can be instantiated" do
    expect(FactoryGirl.build_stubbed(:user)).to         be_an_instance_of(User)
    expect(FactoryGirl.build_stubbed(:user, :admin)).to be_an_instance_of(User)
  end
  #
  it "is invalid with invalid email" do
    expect(FactoryGirl.build_stubbed(:user, email: nil)).to be_invalid
    expect(FactoryGirl.build_stubbed(:user, email: '')).to be_invalid

    %w(email invalid@email@invalid invalid@ @email).each do |email|
      expect(FactoryGirl.build_stubbed(:user, email: email)).to be_invalid
    end
  end
end
