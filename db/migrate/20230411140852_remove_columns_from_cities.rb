class RemoveColumnsFromCities < ActiveRecord::Migration[7.0]
  def change
    remove_column :cities, :address, :string
    remove_column :cities, :latitude, :float
    remove_column :cities, :longitude, :float
  end
end
