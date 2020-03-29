class AddDetailsToSites < ActiveRecord::Migration[6.0]
  def change
    add_column :sites, :city, :string
    add_column :sites, :status, :string
    add_column :sites, :tag, :string
  end
end
