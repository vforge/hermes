if Rails.env.development?
  User.new(id: -1, email: 'system', password: 'system', password_confirmation: 'system', role: :admin).quiet_save
  AdCampaign.create!(name: 'Lorem', company: 'Ipsum', starting_at: 10.hours.ago, ending_at: 2.years.from_now)
end
