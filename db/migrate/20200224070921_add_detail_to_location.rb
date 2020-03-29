class AddDetailToLocation < ActiveRecord::Migration[6.0]
  def change
    add_column :locations, :longitude, :float
    add_column :locations, :latitude, :float
    add_column :locations, :sunshine, :float
    add_column :locations, :temperature, :float
    add_column :locations, :wind_speed, :float
  end
end
