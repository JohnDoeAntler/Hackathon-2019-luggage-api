class CreateFlights < ActiveRecord::Migration[6.0]
  def change
    create_table :flights do |t|
      t.references :airplane, null: false, foreign_key: true

      t.timestamps
    end
  end
end
