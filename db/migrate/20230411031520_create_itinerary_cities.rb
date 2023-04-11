class CreateItineraryCities < ActiveRecord::Migration[7.0]
  def change
    create_table :itinerary_cities do |t|
      t.references :itinerary, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
