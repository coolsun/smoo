class AddCodeToActionsAndPermissions < ActiveRecord::Migration[6.0]
  def change
    add_column :actions, :code, :string
    add_column :permissions, :code, :string
  end
end
