class AddLocationProperties1 < ActiveRecord::Migration[6.0]
  def change
    add_column :locations, :area, :string
    add_column :locations, :road, :string
    add_column :locations, :concat_name, :string
    add_column :locations, :concat_phone, :string
    add_column :locations, :pr, :float
    add_column :locations, :meter_date, :date
    add_column :locations, :default_rate, :float
    add_column :locations, :default_model_brand, :string
    add_column :locations, :default_model_type, :string
    add_column :locations, :image, :string
    add_column :locations, :total_device, :float
    add_column :locations, :total_power, :float
    add_column :locations, :line_loss_rate, :float
    add_column :locations, :decimal_point, :integer
    add_column :locations, :average_insolation, :float
  end
end
