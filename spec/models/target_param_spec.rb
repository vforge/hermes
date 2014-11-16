# == Schema Information
# Schema version: 20141116174002
#
# Table name: target_params
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  category        :string(255)
#  possible_values :string(255)
#  default         :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#
# Indexes
#
#  tp_c  (category)
#

require 'rails_helper'

RSpec.describe TargetParam, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build_stubbed(:target_param)).to be_valid
  end

  it "can be instantiated" do
    expect(FactoryGirl.build_stubbed(:target_param)).to be_an_instance_of(TargetParam)
  end
end
