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
#  visible        :boolean          default(TRUE)
#  created_at     :datetime
#  updated_at     :datetime
#
# Indexes
#
#  ad_s    (visible,status)
#  ad_sa   (visible,status,ad_campaign_id)
#  ad_sa2  (visible,status,ad_size_id)
#  ad_v    (visible)
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
