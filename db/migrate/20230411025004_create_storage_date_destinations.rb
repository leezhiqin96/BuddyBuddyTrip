class CreateStorageDateDestinations < ActiveRecord::Migration[7.0]
  def change
    create_table :storage_date_destinations do |t|
      t.references :storage_date, null: false, foreign_key: true
      t.references :destination, null: false, foreign_key: true
      t.timestamps
    end
  end
end
