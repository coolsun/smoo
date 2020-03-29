class CreateGlobalConfigs < ActiveRecord::Migration[6.0]
  def change
    create_table :global_configs do |t|
      t.string :name
      t.string :value
      t.string :kind
      t.timestamps
    end
  end
end
