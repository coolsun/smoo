class AddMpptsToLocations < ActiveRecord::Migration[6.0]
  def change
    add_column :locations, :mppts, :text
  end
end