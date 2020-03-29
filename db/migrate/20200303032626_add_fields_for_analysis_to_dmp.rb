class AddFieldsForAnalysisToDmp < ActiveRecord::Migration[6.0]
  def change
    add_column :device_model_properties, :unit, :string
    add_column :device_model_properties, :gain, :integer
    add_column :device_model_properties, :address, :integer
    add_column :device_model_properties, :quantity, :integer
    add_column :device_model_properties, :count, :integer
  end
end
