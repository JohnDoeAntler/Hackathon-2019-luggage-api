class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.string :username
      t.string :password_digest

      t.timestamps
    end
    add_index :stores, :username, unique: true
  end
end
