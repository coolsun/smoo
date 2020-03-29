class AddLocationIdToDevices < ActiveRecord::Migration[6.0]
  def self.up
    drop_table :locations_devices

    add_column :devices, :location_id, :integer
    add_index :devices, :location_id
  end
end
