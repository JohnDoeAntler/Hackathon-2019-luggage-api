class CreateAirplaneClasses < ActiveRecord::Migration[6.0]
  def change
    create_table :airplane_classes do |t|
      t.references :airplane, null: false, foreign_key: true
      t.integer :cot, null: false
      t.integer :space_amount, null: false
      t.decimal :space_length, null: false
      t.decimal :space_width, null: false
      t.decimal :space_height, null: false
      t.decimal :distributed_space_percentage, null: false
      t.decimal :purchasable_space_percentage, null: false

      t.timestamps
    end
  end
end
