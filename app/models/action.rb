class Action < ApplicationRecord
  has_many :roles_actions
  has_many :roles, through: :roles_actions

  validates :name, presence: true
  validates :code, presence: true, uniqueness: true

  PERMISSION      = 'permission'
  MAINTAIN_DEVICE = 'maintain_device'
end