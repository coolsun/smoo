class AddMpptsTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :locations, :mppts

    create_table(:mppts) do |t|
      t.belongs_to :device, index: true ,foreign_key: true
      t.text :coordinates

      t.timestamps
    end
  end
end
