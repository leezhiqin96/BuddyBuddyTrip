class AddForeignKeyToStorageDate < ActiveRecord::Migration[7.0]
  def change
    add_reference :storage_dates, :itinerary, foreign_key: true, null: false
  end
end
