class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :role
      t.string :locale

      t.timestamps
    end

    add_index :users, [:role], name: :us_r
    add_index :users, [:email, :password_digest], name: :us_ep
  end
end
