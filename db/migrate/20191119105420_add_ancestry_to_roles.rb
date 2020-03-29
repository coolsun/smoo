class AddAncestryToRoles < ActiveRecord::Migration[6.0]
  def change
    add_column :roles, :ancestry, :string
    add_index :roles, :ancestry
  end
end
