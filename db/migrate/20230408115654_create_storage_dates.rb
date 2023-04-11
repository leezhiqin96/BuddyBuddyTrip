class CreateStorageDates < ActiveRecord::Migration[7.0]
  def change
    create_table :storage_dates do |t|
      t.datetime :date, null: false
      t.timestamps
    end
  end
end
