class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.timestamps
    end

    create_table :sites_locations do |t|
      t.belongs_to :site, index: true
      t.belongs_to :location, index: true
      t.timestamps
    end
  end
end
