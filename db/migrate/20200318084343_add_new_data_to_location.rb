class AddNewDataToLocation < ActiveRecord::Migration[6.0]
  def change
    add_column :locations, :announcement_average_sunshine, :datetime
    add_column :locations, :recent_inspect_date, :datetime
    add_column :locations, :next_inspect_date, :datetime
    add_column :locations, :attrition_rate, :float
  end
end
