# == Schema Information
# Schema version: 20141116174002
#
# Table name: ad_sizes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  width      :integer
#  height     :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe AdSize, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build_stubbed(:ad_size)).to be_valid
  end

  it "can be instantiated" do
    expect(FactoryGirl.build_stubbed(:ad_size)).to be_an_instance_of(AdSize)
  end
end
