class ChangeBoardOrderColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :boards, :order
    add_column :boards_locations, :index, :integer
  end
end
