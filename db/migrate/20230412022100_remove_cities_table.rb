class RemoveCitiesTable < ActiveRecord::Migration[7.0]
  def change
    # Remove any foreign keys that other table have on cities table
    remove_reference :destinations, :city, foreign_key: true, index: false
    remove_reference :itinerary_cities, :city, foreign_key: true, index: false

    # Rename joint table between itinerary and cities into countries
    rename_table :itinerary_cities, :itinerary_countries

    # Add foreign key into relevant table
    add_column :destinations, :country_code, :string
    add_foreign_key :destinations, :countries, column: :country_code, primary_key: :country_code
    add_column :itinerary_countries, :country_code, :string
    add_foreign_key :itinerary_countries, :countries, column: :country_code, primary_key: :country_code

    # Drop cities table
    drop_table :cities
  end
end
