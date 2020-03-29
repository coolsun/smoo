class AddTypeToDevice < ActiveRecord::Migration[6.0]
  def change
    add_column :devices, :device_type, :string
  end
end
