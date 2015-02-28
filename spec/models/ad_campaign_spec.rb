# == Schema Information
# Schema version: 20150203213425
#
# Table name: ad_campaigns
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  company     :string(255)
#  starting_at :datetime
#  ending_at   :datetime
#  target      :string(255)
#  status      :string(255)
#  deleted_at  :datetime
#  created_at  :datetime
#  updated_at  :datetime
#
# Indexes
#
#  ac_c    (deleted_at,company)
#  ac_s    (deleted_at,status)
#  ac_sse  (deleted_at,status,starting_at,ending_at)
#  ac_x    (deleted_at)
#

require 'rails_helper'

RSpec.describe AdCampaign, type: :model do
  it { is_expected.to enumerize(:status).in(:active, :inactive) }

  it 'has a valid factory' do
    expect(FactoryGirl.build_stubbed(:ad_campaign)).to be_valid
  end

  it 'can be instantiated' do
    expect(FactoryGirl.build_stubbed(:ad_campaign)).to be_an_instance_of(described_class)
  end
  #
  it 'is invalid with invalid data' do
    expect(FactoryGirl.build_stubbed(:ad_campaign, name: nil)).to be_invalid
    expect(FactoryGirl.build_stubbed(:ad_campaign, company: nil)).to be_invalid
    expect(FactoryGirl.build_stubbed(:ad_campaign, starting_at: nil)).to be_invalid
    expect(FactoryGirl.build_stubbed(:ad_campaign, ending_at: nil)).to be_invalid
  end
end
