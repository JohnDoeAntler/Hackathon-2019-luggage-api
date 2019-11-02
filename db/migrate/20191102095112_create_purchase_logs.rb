class CreatePurchaseLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_logs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :store, null: true, foreign_key: true
      t.decimal :space_increasement, null: false

      t.timestamps
    end
  end
end
