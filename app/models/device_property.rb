class DeviceProperty < ApplicationRecord
  belongs_to :device_type
  has_many :device_property_values
  
  #TODO: Add UNIT CONSTANT

  validates :name,     presence: true, uniqueness: {scope: :device_type}
  validates :level,    presence: true
  validates :kind,     presence: true
  #validates :unit,     presence: true
  validates :required, presence: true
end
