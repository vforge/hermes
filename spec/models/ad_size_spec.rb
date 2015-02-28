# == Schema Information
# Schema version: 20150203213425
#
# Table name: ad_sizes
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  classification :string(255)
#  width          :integer
#  height         :integer
#  status         :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#
# Indexes
#
#  ad_sizes_s  (status)
#

require 'rails_helper'

RSpec.describe AdSize, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.build_stubbed(:ad_size)).to be_valid
  end

  it 'can be instantiated' do
    expect(FactoryGirl.build_stubbed(:ad_size)).to be_an_instance_of(described_class)
  end
  #
  it 'is invalid with invalid data' do
    expect(FactoryGirl.build_stubbed(:ad_size, name: nil)).to be_invalid
    expect(FactoryGirl.build_stubbed(:ad_size, classification: nil)).to be_invalid
    expect(FactoryGirl.build_stubbed(:ad_size, width: 0)).to be_invalid
    expect(FactoryGirl.build_stubbed(:ad_size, height: 0)).to be_invalid
  end
end
