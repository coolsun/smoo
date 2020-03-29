class RolesAction < ApplicationRecord
  belongs_to :role
  belongs_to :action

  has_many :roles_actions_permissions, dependent: :delete_all
  has_many :permissions, through: :roles_actions_permissions
end