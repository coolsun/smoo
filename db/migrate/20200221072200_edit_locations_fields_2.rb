class EditLocationsFields2 < ActiveRecord::Migration[6.0]
  def change
    rename_column :locations, :contcat_name, :contact_name
    rename_column :locations, :contcat_phone, :contact_phone
  end
end
