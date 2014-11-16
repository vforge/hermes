# == Schema Information
# Schema version: 20141116174002
#
# Table name: ads
#
#  id             :integer          not null, primary key
#  filename       :string(255)
#  ad_campaign_id :integer
#  status         :string(255)
#  ad_size_id     :integer
#  created_at     :datetime
#  updated_at     :datetime
#
# Indexes
#
#  ad_s    (status)
#  ad_sa   (status,ad_campaign_id)
#  ad_sa2  (status,ad_size_id)
#

require 'rails_helper'

RSpec.describe Ad, type: :model do
  it { is_expected.to enumerize(:status).in(:active, :inactive) }

  it "has a valid factory" do
    expect(FactoryGirl.build_stubbed(:ad)).to be_valid
  end

  it "can be instantiated" do
    expect(FactoryGirl.build_stubbed(:ad)).to be_an_instance_of(Ad)
  end
end
