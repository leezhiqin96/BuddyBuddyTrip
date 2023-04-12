class AddCoordinatesToTables < ActiveRecord::Migration[7.0]
  def change
    add_column :cities, :latitude, :float
    add_column :cities, :longitude, :float
    add_column :destinations, :latitude, :float
    add_column :destinations, :longitude, :float
  end
end
