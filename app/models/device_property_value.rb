class DevicePropertyValue < ApplicationRecord
  belongs_to :dynamic_property_model, polymorphic: true
  belongs_to :device_property
  
  validates :value, presence: true
end