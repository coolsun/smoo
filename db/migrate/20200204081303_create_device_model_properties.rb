class CreateDeviceModelProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :device_model_properties do |t|
      t.string :name
      t.string :kind
      t.belongs_to :device_model, index: true

      t.timestamps
    end
  end
end
