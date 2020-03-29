class AddRelatedActionAndPermissionFields < ActiveRecord::Migration[6.0]
  def change
    create_table(:actions) do |t|
      t.string :name

      t.timestamps
    end

    create_table(:roles_actions) do |t|
      t.integer :role_id
      t.integer :action_id

      t.timestamps
    end

    create_table(:permissions) do |t|
      t.string :name
      t.integer :sort
      t.timestamps
    end

    create_table(:roles_actions_permissions) do |t|
      t.integer :roles_action_id
      t.integer :permission_id
      t.timestamps
    end
  end
end
