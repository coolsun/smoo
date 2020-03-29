# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_19_074128) do

  create_table "actions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "code"
  end

  create_table "boards", force: :cascade do |t|
    t.string "name"
    t.string "firm_name"
    t.integer "count"
    t.integer "carousel_second"
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "site_id"
    t.index ["site_id"], name: "index_boards_on_site_id"
  end

  create_table "boards_locations", force: :cascade do |t|
    t.integer "board_id"
    t.integer "location_id"
    t.integer "index"
    t.index ["board_id"], name: "index_boards_locations_on_board_id"
    t.index ["location_id"], name: "index_boards_locations_on_location_id"
  end

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "device_model_properties", force: :cascade do |t|
    t.string "name"
    t.string "kind"
    t.integer "device_model_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "unit"
    t.integer "gain"
    t.integer "address"
    t.integer "quantity"
    t.integer "count"
    t.index ["device_model_id"], name: "index_device_model_properties_on_device_model_id"
  end

  create_table "device_models", force: :cascade do |t|
    t.string "name"
    t.text "normalize_json"
    t.text "normalize_function"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "brand_id"
    t.integer "model_id"
    t.integer "device_type_id"
    t.index ["brand_id"], name: "index_device_models_on_brand_id"
    t.index ["device_type_id"], name: "index_device_models_on_device_type_id"
    t.index ["model_id"], name: "index_device_models_on_model_id"
  end

  create_table "device_properties", force: :cascade do |t|
    t.string "name"
    t.string "device_type"
    t.string "value"
    t.string "normalize"
    t.integer "device_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "level"
    t.string "kind"
    t.string "unit"
    t.boolean "required"
    t.integer "device_type_id"
    t.index ["device_id"], name: "index_device_properties_on_device_id"
    t.index ["device_type_id"], name: "index_device_properties_on_device_type_id"
  end

  create_table "device_property_values", force: :cascade do |t|
    t.string "value"
    t.integer "dynamic_property_model_id"
    t.string "dynamic_property_model_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "device_property_id"
    t.index ["device_property_id"], name: "index_device_property_values_on_device_property_id"
    t.index ["dynamic_property_model_id"], name: "index_device_property_values_on_dynamic_property_model_id"
  end

  create_table "device_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "devices", force: :cascade do |t|
    t.string "name"
    t.integer "device_model_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "ancestry"
    t.integer "location_id"
    t.text "mppt_coordinates"
    t.string "shared_location"
    t.string "share_device_name"
    t.index ["ancestry"], name: "index_devices_on_ancestry"
    t.index ["device_model_id"], name: "index_devices_on_device_model_id"
    t.index ["location_id"], name: "index_devices_on_location_id"
  end

  create_table "error_logs", force: :cascade do |t|
    t.integer "location_id"
    t.string "error_source"
    t.string "log_type"
    t.string "log"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["location_id"], name: "index_error_logs_on_location_id"
  end

  create_table "global_configs", force: :cascade do |t|
    t.string "name"
    t.string "value"
    t.string "kind"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "city"
    t.string "status"
    t.string "area"
    t.string "street"
    t.string "contact_name"
    t.string "contact_phone"
    t.float "goal_pr"
    t.date "meter_date"
    t.float "default_rate"
    t.string "default_model_brand"
    t.string "default_model_type"
    t.string "image"
    t.float "total_device"
    t.float "total_power"
    t.float "line_loss_rate"
    t.integer "decimal_point"
    t.float "average_insolation"
    t.string "code"
    t.float "longitude"
    t.float "latitude"
    t.float "sunshine"
    t.float "temperature"
    t.float "wind_speed"
    t.string "module_brand"
    t.string "module"
    t.string "model"
    t.string "note"
    t.float "electricity_sales_rate"
    t.string "mppt_image_file_name"
    t.string "mppt_image_content_type"
    t.integer "mppt_image_file_size"
    t.datetime "mppt_image_updated_at"
    t.boolean "disable"
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "announcement_average_sunshine"
    t.datetime "recent_inspect_date"
    t.datetime "next_inspect_date"
    t.float "attrition_rate"
  end

  create_table "models", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "normalization_properties", force: :cascade do |t|
    t.string "name"
    t.string "kind"
    t.string "unit"
    t.boolean "required"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "device_type_id"
    t.index ["device_type_id"], name: "index_normalization_properties_on_device_type_id"
  end

  create_table "normalization_property_values", force: :cascade do |t|
    t.string "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "normalization_property_id"
    t.integer "device_id"
    t.index ["device_id"], name: "index_normalization_property_values_on_device_id"
    t.index ["normalization_property_id"], name: "index_nor_p_v_id_on_nor_p_id"
  end

  create_table "permissions", force: :cascade do |t|
    t.string "name"
    t.integer "sort"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "code"
  end

  create_table "raw_properties", force: :cascade do |t|
    t.string "name"
    t.string "kind"
    t.string "unit"
    t.integer "gain"
    t.integer "address"
    t.integer "quantity"
    t.integer "count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "device_model_id"
    t.index ["device_model_id"], name: "index_raw_properties_on_device_model_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.integer "resource_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "ancestry"
    t.index ["ancestry"], name: "index_roles_on_ancestry"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "roles_actions", force: :cascade do |t|
    t.integer "role_id"
    t.integer "action_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "roles_actions_permissions", force: :cascade do |t|
    t.integer "roles_action_id"
    t.integer "permission_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sites", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "disable"
  end

  create_table "sites_locations", force: :cascade do |t|
    t.integer "site_id"
    t.integer "location_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["location_id"], name: "index_sites_locations_on_location_id"
    t.index ["site_id"], name: "index_sites_locations_on_site_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "last_name"
    t.string "phone"
    t.string "address"
    t.string "mobile_phone"
    t.string "invoice_address"
    t.float "data_capacity_limit"
    t.float "used_capacity"
    t.string "sex"
    t.integer "remain_point"
    t.string "service"
    t.datetime "update_at"
    t.string "update_user"
    t.string "data_code"
    t.string "company_name"
    t.string "company_phone"
    t.string "company_fax"
    t.string "company_address_city"
    t.string "company_address_district"
    t.string "company_address_road"
    t.string "first_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "boards", "sites"
  add_foreign_key "boards_locations", "boards"
  add_foreign_key "boards_locations", "locations"
  add_foreign_key "device_models", "brands"
  add_foreign_key "device_models", "device_types"
  add_foreign_key "device_models", "models"
  add_foreign_key "device_properties", "device_types"
  add_foreign_key "device_property_values", "device_properties"
  add_foreign_key "error_logs", "locations"
  add_foreign_key "normalization_properties", "device_types"
  add_foreign_key "normalization_property_values", "devices"
  add_foreign_key "normalization_property_values", "normalization_properties"
  add_foreign_key "raw_properties", "device_models"
end
