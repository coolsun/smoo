class CreateDevices < ActiveRecord::Migration[6.0]
  def change
    create_table :devices do |t|
      t.string :name
      t.belongs_to :device_model, index: true
      t.timestamps
    end

    create_table :device_models do |t|
      t.string :name
      t.text :normalize_json
      t.text :normalize_function
      t.timestamps
    end

    create_table :locations_devices do |t|
      t.belongs_to :location, index: true
      t.belongs_to :device, index: true
      t.timestamps
    end
  end
end
