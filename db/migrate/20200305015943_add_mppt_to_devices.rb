class AddMpptToDevices < ActiveRecord::Migration[6.0]
  def change
    drop_table :mppts
    add_column :devices, :mppt_coordinates, :text
  end
end
