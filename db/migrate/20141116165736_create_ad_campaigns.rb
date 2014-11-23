class CreateAdCampaigns < ActiveRecord::Migration
  def change
    create_table :ad_campaigns do |t|
      t.string    :name
      t.string    :company
      t.datetime  :starting_at
      t.datetime  :ending_at
      t.string    :target
      t.string    :status
      t.boolean   :visible, default: true

      t.timestamps
    end

    add_index :ad_campaigns, [:visible], name: :ac_v
    add_index :ad_campaigns, [:visible, :company], name: :ac_c
    add_index :ad_campaigns, [:visible, :status],  name: :ac_s
    add_index :ad_campaigns, [:visible, :status, :starting_at, :ending_at], name: :ac_sse
  end
end
