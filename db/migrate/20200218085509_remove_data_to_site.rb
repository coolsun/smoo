class RemoveDataToSite < ActiveRecord::Migration[6.0]
  def change
    remove_column :sites, :city
    remove_column :sites, :status
    remove_column :sites, :tag

    add_column :locations, :city, :string
    add_column :locations, :status, :string
  end
end
