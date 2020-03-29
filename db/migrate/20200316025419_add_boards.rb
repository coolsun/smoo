class AddBoards < ActiveRecord::Migration[6.0]
  def change
    create_table(:boards) do |t|
      t.string  :name
      t.string  :firm_name
      t.integer :count
      t.integer :carousel_second
      t.text    :order
      t.text    :comment
      t.timestamps
      
      t.belongs_to :site, index: true ,foreign_key: true
    end
    
    create_table(:boards_locations) do |t|
      t.belongs_to :board, index: true ,foreign_key: true
      t.belongs_to :location, index: true ,foreign_key: true
    end
    
  end
end
