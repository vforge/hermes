class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :email
      t.string  :password_digest
      t.string  :role
      t.string  :locale
      t.boolean :visible, default: true

      t.timestamps
    end

    add_index :users, [:visible], name: :us_v
    add_index :users, [:visible, :role], name: :us_r
    add_index :users, [:visible, :email, :password_digest], name: :us_ep
  end
end
