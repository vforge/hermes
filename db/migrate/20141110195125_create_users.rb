class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   :email
      t.string   :password_digest
      t.string   :role
      t.string   :locale
      t.datetime :deleted_at

      t.timestamps
    end

    add_index :users, [:deleted_at], name: :us_x
    add_index :users, [:deleted_at, :role], name: :us_r
    add_index :users, [:deleted_at, :email, :password_digest], name: :us_ep
  end
end
