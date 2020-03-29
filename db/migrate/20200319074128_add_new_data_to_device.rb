class AddNewDataToDevice < ActiveRecord::Migration[6.0]
  def change
    add_column :devices, :shared_location  , :string
    add_column :devices, :share_device_name, :string
  end
end
