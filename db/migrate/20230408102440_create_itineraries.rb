class CreateItineraries < ActiveRecord::Migration[7.0]
  def change
    create_table :itineraries do |t|
      t.string :name, null: false
      t.datetime :start_date, null: false
      t.datetime :end_date, null: false
      t.integer :total_budget
      t.integer :owner_id, null: false
      t.timestamps
    end

    add_foreign_key :itineraries, :users, column: :owner_id
  end
end
