User.new(email:'admin', password: 'admin', password_confirmation: 'admin', role: :admin).quiet_save
AdCampaign.create!(name: 'Lorem', company: 'Ipsum', starting_at: 10.hours.ago, ending_at: 2.years.from_now)
