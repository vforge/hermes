class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.attachment :file
      t.text    :file_meta
      t.string  :file_fingerprint
      t.integer :ad_campaign_id
      t.text    :href
      t.string  :status
      t.integer :ad_size_id
      t.boolean :visible, default: true

      t.integer :count_requests,  default: 0
      t.integer :count_clicks,    default: 0

      t.timestamps
    end

    add_index :ads, [:visible],                            name: :ad_v
    add_index :ads, [:visible, :status],                   name: :ad_s
    add_index :ads, [:visible, :status, :ad_campaign_id],  name: :ad_sa
    add_index :ads, [:visible, :status, :ad_size_id],      name: :ad_sa2
  end
end
