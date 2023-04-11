class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.string :name, null: false
      t.string :expense_type, null: false
      t.integer :amount, null: false
      t.datetime :expense_date
      t.references :itinerary, null: false, foreign_key: true

      t.timestamps
    end
  end
end
