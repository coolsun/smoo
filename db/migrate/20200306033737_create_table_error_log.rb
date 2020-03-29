class CreateTableErrorLog < ActiveRecord::Migration[6.0]
  def change
    create_table(:error_logs) do |t|
      t.belongs_to :location, index: true ,foreign_key: true
      t.string     :error_source
      t.string     :log_type
      t.string     :log

      t.timestamps
    end
  end
end
