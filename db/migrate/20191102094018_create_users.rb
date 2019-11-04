class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :ticket_id, null: false
      t.integer :seat_index, null: false
      t.references :airplane_class, null: false, foreign_key: true
      t.references :flight, null: false, foreign_key: true

      t.timestamps
    end
    add_index :users, :ticket_id, unique: true
  end
end
