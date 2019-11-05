class CreateLuggages < ActiveRecord::Migration[6.0]
  def change
    create_table :luggages do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :length, null: false, precision: 12, scale: 3
      t.decimal :width, null: false, precision: 12, scale: 3
      t.decimal :height, null: false, precision: 12, scale: 3
      t.text :image_url, null: false
      t.integer :space_index, null: false

      t.timestamps
    end
  end
end
