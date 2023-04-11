class RemoveItineraryStorageDateTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :itinerary_storage_dates
  end
end
