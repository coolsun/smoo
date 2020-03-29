class AddDisableToLocationSite < ActiveRecord::Migration[6.0]
  def change
    add_column :locations, :disable, :boolean
    add_column :sites, :disable, :boolean

    rename_column :locations, :pr, :goal_pr
    end
end
