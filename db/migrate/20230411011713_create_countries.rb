class CreateCountries < ActiveRecord::Migration[7.0]
  def change
    create_table :countries, id: false do |t|
      t.string :country_code, primary_key: true, null: false
      t.string :name, null: false
      t.timestamps
    end
  end
end
