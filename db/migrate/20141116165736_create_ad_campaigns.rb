class CreateAdCampaigns < ActiveRecord::Migration
  def change
    create_table :ad_campaigns do |t|
      t.string    :name
      t.string    :company
      t.datetime  :starting_at
      t.datetime  :ending_at
      t.string    :target
      t.string    :status

      t.timestamps
    end

    add_index :ad_campaigns, [:company], name: :ac_c
    add_index :ad_campaigns, [:status],  name: :ac_s
    add_index :ad_campaigns, [:status, :starting_at, :ending_at], name: :ac_sse
  end
end
