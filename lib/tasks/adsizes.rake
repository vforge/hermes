require 'csv'

desc "Imports a CSV file into an AdSizes table"
namespace :import do
  task :adsizes => :environment do
    AdSize.destroy_all
    CSV.foreach(Rails.root.join('lib', 'tasks', 'adsizes.csv'), headers: true) do |row|
      AdSize.create!(row.to_hash)
    end
  end
end
