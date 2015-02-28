class CreateAdSizes < ActiveRecord::Migration
  def change
    create_table :ad_sizes do |t|
      t.string   :name
      t.string   :classification
      t.integer  :width
      t.integer  :height
      t.string   :status
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :ad_sizes, [:deleted_at],                            name: :ad_sizes_x
    add_index :ad_sizes, [:deleted_at, :status],                   name: :ad_sizes_s
  end
end
