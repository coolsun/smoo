class User < ApplicationRecord
  attr_accessor :current_role


  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :registerable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  #validates :name, presence: true, uniqueness: true
  
  def can?(action_code, permission_code)
    return false if current_role.blank?

    rap = RolesActionsPermission.
          joins(:permission, roles_action: [:role, :action]).
          where('roles.id = ? AND actions.code = ? AND permissions.code = ?', current_role.id, action_code, permission_code).first

    rap.present?
  end

  def is_admin?
    current_role.present? && current_role.is_admin?
  end

  def site
    current_role.try(:resource)
  end
end
