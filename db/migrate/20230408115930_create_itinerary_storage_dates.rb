class CreateItineraryStorageDates < ActiveRecord::Migration[7.0]
  def change
    create_table :itinerary_storage_dates do |t|
      t.references :itinerary, null: false, foreign_key: true
      t.references :storage_date, null: false, foreign_key: true

      t.timestamps
    end
  end
end
