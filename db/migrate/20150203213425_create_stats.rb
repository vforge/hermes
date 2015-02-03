class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.string    :classification # impression, click
      t.string    :uuid           # unique user id (given by caller)
      t.integer   :ad_id

      t.timestamps
    end

    add_index :stats, [:classification], name: :st_c
  end
end
