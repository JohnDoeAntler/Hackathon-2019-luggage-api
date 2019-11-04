class CreateAirplaneClasses < ActiveRecord::Migration[6.0]
  def change
    create_table :airplane_classes do |t|
      t.references :airplane, null: false, foreign_key: true
      t.integer :cot, null: false
      t.integer :seat_amount, null: false
      t.integer :bin_amount, null: false
      t.decimal :bin_length, null: false, precision: 6, scale: 3
      t.decimal :bin_width, null: false, precision: 6, scale: 3
      t.decimal :bin_height, null: false, precision: 6, scale: 3
      t.decimal :assignable_space_percentage, null: false, precision: 6, scale: 3
      t.decimal :purchasable_space_percentage, null: false, precision: 6, scale: 3

      t.timestamps
    end
  end
end
