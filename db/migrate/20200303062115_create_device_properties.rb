class CreateDeviceProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :device_properties do |t|
      t.string :name
      t.string :device_type
      t.string :value
      t.string :normalize
      t.belongs_to :device, index: true

      t.timestamps
    end
    remove_column :devices, :device_type
  end
end
