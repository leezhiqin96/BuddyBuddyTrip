class CreateCities < ActiveRecord::Migration[7.0]
  def change
    create_table :cities do |t|
      t.string :name, null: false
      t.text :description
      t.string :address, null: false
      t.string :country_code, null: false
      t.timestamps
    end
  end
end
