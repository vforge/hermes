class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string   :filename
      t.integer  :ad_campaign_id
      t.text     :href
      t.string   :status
      t.integer  :ad_size_id
      t.datetime :deleted_at
      t.timestamps
    end

    add_index :ads, [:deleted_at],                            name: :ad_x
    add_index :ads, [:deleted_at, :status],                   name: :ad_s
    add_index :ads, [:deleted_at, :status, :ad_campaign_id],  name: :ad_sa
    add_index :ads, [:deleted_at, :status, :ad_size_id],      name: :ad_sa2
  end
end
