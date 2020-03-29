class AddDataToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :last_name, :string
    add_column :users, :phone,     :string
    add_column :users, :address,   :string
    add_column :users, :mobile_phone, :string
    add_column :users, :invoice_address, :string
    add_column :users, :data_capacity_limit, :float
    add_column :users, :used_capacity, :float
    add_column :users, :sex,    :string
    add_column :users, :remain_point, :integer 
    add_column :users, :service, :string
    add_column :users, :update_at, :datetime
    add_column :users, :update_user, :string
    add_column :users, :data_code, :string
    add_column :users, :company_name, :string
    add_column :users, :company_phone, :string
    add_column :users, :company_fax, :string
    add_column :users, :company_address_city, :string
    add_column :users, :company_address_district, :string
    add_column :users, :company_address_road, :string
  end
end
