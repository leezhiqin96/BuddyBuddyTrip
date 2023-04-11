class AddForeignKeysToTables < ActiveRecord::Migration[7.0]
  def change
    add_reference :destinations, :city, foreign_key: true, null: false
    add_foreign_key :cities, :countries, column: :country_code, primary_key: :country_code
  end
end
