class CreateAdSizes < ActiveRecord::Migration
  def change
    create_table :ad_sizes do |t|
      t.string  :name
      t.integer :width
      t.integer :height

      t.timestamps
    end
  end
end
