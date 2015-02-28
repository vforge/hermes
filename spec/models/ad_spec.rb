# == Schema Information
# Schema version: 20150203213425
#
# Table name: ads
#
#  id             :integer          not null, primary key
#  filename       :string(255)
#  ad_campaign_id :integer
#  href           :text
#  status         :string(255)
#  ad_size_id     :integer
#  deleted_at     :datetime
#  created_at     :datetime
#  updated_at     :datetime
#
# Indexes
#
#  ad_s    (deleted_at,status)
#  ad_sa   (deleted_at,status,ad_campaign_id)
#  ad_sa2  (deleted_at,status,ad_size_id)
#  ad_x    (deleted_at)
#

require 'rails_helper'

RSpec.describe Ad, type: :model do
  it { is_expected.to enumerize(:status).in(:active, :inactive) }

  it 'has a valid factory' do
    expect(FactoryGirl.build_stubbed(:ad)).to be_valid
  end

  it 'can be instantiated' do
    expect(FactoryGirl.build_stubbed(:ad)).to be_an_instance_of(described_class)
  end
end
