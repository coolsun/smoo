class Role < ApplicationRecord
  has_and_belongs_to_many :users, :join_table => :users_roles


  belongs_to :resource,
          :polymorphic => true,
          :optional => true

  # 目前development預設並沒有預先load所有model導致Rolify.resource_types是空的array
  if Rails.env == 'production'
    validates :resource_type, :inclusion => { :in => Rolify.resource_types }, :allow_nil => true
  end

  scopify
  has_ancestry

  has_many :roles_actions
  has_many :actions, through: :roles_actions

  validates :name, presence: true, uniqueness: true

  
  GLOBAL_RESOURCE_NAME = '*'
  SITE_RESOURCE_NAME = 'Site'
  RESOURCE_TYPE = [GLOBAL_RESOURCE_NAME, SITE_RESOURCE_NAME]
  
  ADMIN_NAME = 'admin'

  def self.get_admin
    where(name: ADMIN_NAME, resource_type: nil, resource_id: nil).first
  end

  def is_site_role?
    resource_type == SITE_RESOURCE_NAME && resource_id.present?
  end

  def is_admin?
    !is_site_role? && name == ADMIN_NAME
  end
end
