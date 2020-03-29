class AddDetailToLocation2 < ActiveRecord::Migration[6.0]
  def change  
    add_column :locations, :module_brand, :string
    add_column :locations, :module, :string
    add_column :locations, :model, :string
    add_column :locations, :note, :string
    add_column :locations, :electricity_sales_rate, :float
  end
end
