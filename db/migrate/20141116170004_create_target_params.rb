class CreateTargetParams < ActiveRecord::Migration
  def change
    create_table :target_params do |t|
      t.string :name
      t.string :category
      t.string :possible_values
      t.string :default

      t.timestamps
    end

    add_index :target_params, [:category], name: :tp_c
  end
end
