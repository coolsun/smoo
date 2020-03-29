class RolesActionsPermission < ApplicationRecord
  belongs_to :roles_action
  belongs_to :permission
end