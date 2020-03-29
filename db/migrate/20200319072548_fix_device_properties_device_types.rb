class FixDevicePropertiesDeviceTypes < ActiveRecord::Migration[6.0]
  def change
    remove_reference :device_properties, :device_types, index: true ,foreign_key: true
    add_reference :device_properties, :device_type, index: true ,foreign_key: true
  end
end
