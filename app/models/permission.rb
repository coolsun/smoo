class Permission < ApplicationRecord
  validates :name, presence: true
  validates :code, presence: true, uniqueness: true

  BROWSE = 'browse'
  ADD    = 'add'
  REMOVE = 'remove'
  EDIT   = 'edit'
  VOID   = 'void'
  REVIEW = 'review'
  EXPORT = 'export'
  EXEC   = 'exec'
end