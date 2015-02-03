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

FactoryGirl.define do
  factory :ad do
    ad_campaign

    filename   Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/empty.png')))

    href        { Faker::Internet.url }
    status      :active

    trait :inactive do
      status :inactive
    end
  end
end
