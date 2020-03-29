class AddAncestryToDevice < ActiveRecord::Migration[6.0]
  def change
    add_column :devices, :ancestry, :string
    add_index :devices, :ancestry
  end
end
