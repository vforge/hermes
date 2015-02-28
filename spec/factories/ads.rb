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
