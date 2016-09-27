class AddLatLngToProfileAndPrograms < ActiveRecord::Migration
  def change
    add_column :profiles, :latitude, :float, precision: 8, scale: 5
    add_column :profiles, :longitude, :float, precision: 8, scale: 5
    add_column :programs, :latitude, :float, precision: 8, scale: 5
    add_column :programs, :longitude, :float, precision: 8, scale: 5
  end
end
