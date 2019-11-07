class CreateStaffs < ActiveRecord::Migration[6.0]
  def change
    create_table :staffs do |t|
      t.string :username
      t.string :password_digest
      t.integer :role

      t.timestamps
    end
    add_index :staffs, :username, unique: true
  end
end
