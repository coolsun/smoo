class EditLocationsFields1 < ActiveRecord::Migration[6.0]
  def change
    rename_column :locations, :concat_name, :contcat_name
    rename_column :locations, :concat_phone, :contcat_phone
    rename_column :locations, :road, :street

    add_column :locations, :code, :string
  end
end
