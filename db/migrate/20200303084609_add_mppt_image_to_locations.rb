class AddMpptImageToLocations < ActiveRecord::Migration[6.0]
  def up
    add_attachment :locations, :mppt_image
  end

  def down
    remove_attachment :locations, :mppt_image
  end
end
