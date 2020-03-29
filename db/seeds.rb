# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Test data
admin        = User.create(name: 'admin', email: 'admin@example.com', password: '24211928', password_confirmation: '24211928')
site_admin   = User.create(name: 'site_admin', email: 'site_admin@example.com', password: '24211928', password_confirmation: '24211928')
site_user    = User.create(name: 'site_user', email: 'site_user@example.com', password: '24211928', password_confirmation: '24211928')
manager      = User.create(name: 'manager', email: 'manager@example.com', password: '24211928', password_confirmation: '24211928')
site_manager = User.create(name: 'site_manager', email: 'site_manager@example.com', password: '24211928', password_confirmation: '24211928')

admin_role        = admin.add_role :admin
site_admin_role   = site_admin.add_role :site_admin, Site
site_user_role    = site_user.add_role :site_user, Site
manager_role      = manager.add_role :manager
site_manager_role = site_manager.add_role :site_manager, Site

site_admin_role.parent = admin_role
site_admin_role.save

site_user_role.parent = site_admin_role
site_user_role.save

manager_role.parent = admin_role
manager_role.save

site_manager_role.parent = manager_role
site_manager_role.save

role_action = Action.create(name: '權限設定', code: 'Role')
maintain_device_action = Action.create(name: '維護設備', code: 'Device')
site_action = Action.create(name: '維護公司', code: 'Site')
location_action = Action.create(name: '維護案場', code: 'Location')
user_location = Action.create(name: '維護使用者', code: 'User')
device_model_action = Action.create(name: '維護設備模組', code: 'DeviceModel')

[admin_role, site_admin_role, site_user_role, manager_role, site_manager_role].each do |role|
  [role_action,maintain_device_action,site_action, location_action,user_location,device_model_action].each do |action|
    RolesAction.create(role: role, action: action)
  end
end

[['瀏覽', 'index'], ['新增', 'new'], ['刪除', 'destroy'], ['修改', 'edit'], ['無效', 'void'], 
['審核', 'review'], ['匯出', 'export'], ['執行', 'exec']].each_with_index do |data, index|
  Permission.create(name: data[0], code: data[1], sort: index)
end

# [['test1','彰化縣','正常','中部']['test2','台北市','警告','北部']['test3','高雄市','異常','南部']].each do |data|
#   Site.create(name: data[0], city: data[1], status: data[2], tag: data[3])
# end

all_role_actions = RolesAction.all
all_permissions = Permission.all

all_role_actions.each do |ra|
  all_permissions.each do |permission|
    RolesActionsPermission.create(roles_action: ra, permission: permission)
  end
end

# GlobalConfig
GlobalConfig.create(name: 'discharge_coefficient', value: 1.0, kind: 'float')