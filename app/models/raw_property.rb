class RawProperty < ApplicationRecord
  KIND = ['I16', 'U16', 'I32', 'U32']
  UNIT = ['V', 'A']

  belongs_to :device_model

  validates :name, presence: true, uniqueness: true
  validates :kind, presence: true, inclusion: KIND
  validates :unit, presence: true, inclusion: UNIT
  
  validates :gain,     presence: true
  validates :address,  presence: true
  validates :quantity, presence: true
  validates :count,    presence: true
end