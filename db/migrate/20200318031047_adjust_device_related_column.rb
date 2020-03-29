class AdjustDeviceRelatedColumn < ActiveRecord::Migration[6.0]
  def change
    create_table(:brands) do |t|
      t.string  :name
      t.timestamps
    end

    create_table(:models) do |t|
      t.string  :name
      t.timestamps
    end

    add_reference :device_models, :brand, index: true ,foreign_key: true
    add_reference :device_models, :model, index: true ,foreign_key: true

    create_table(:device_types) do |t|
      t.string  :name
      t.timestamps
    end
    add_reference :device_models, :device_type, index: true ,foreign_key: true

    # device_properties
    add_column :device_properties, :level, :string
    add_column :device_properties, :kind, :string
    add_column :device_properties, :unit, :string
    add_column :device_properties, :required, :boolean

    add_reference :device_properties, :device_types, index: true ,foreign_key: true

    create_table(:device_property_values) do |t|
      t.string  :value
      t.integer :dynamic_property_model_id
      t.string  :dynamic_property_model_type
      t.timestamps

      t.belongs_to :device_property, index: true ,foreign_key: true
    end
    add_index :device_property_values, :dynamic_property_model_id

    create_table(:normalization_properties) do |t|
      t.string  :name
      t.string  :kind
      t.string  :unit
      t.boolean :required
      t.timestamps

      t.belongs_to :device_type, index: true ,foreign_key: true
    end

    create_table(:normalization_property_values) do |t|
      t.string  :value
      t.timestamps

      t.belongs_to :normalization_property, index: {name: :index_nor_p_v_id_on_nor_p_id} ,foreign_key: true
      t.belongs_to :device, index: true ,foreign_key: true
    end    

    create_table(:raw_properties) do |t|
      t.string  :name
      t.string  :kind
      t.string  :unit
      t.integer :gain
      t.integer :address
      t.integer :quantity
      t.integer :count
      t.timestamps

      t.belongs_to :device_model, index: true ,foreign_key: true
    end

  end
end
