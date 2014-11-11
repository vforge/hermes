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
end
