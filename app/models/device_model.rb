class DeviceModel < ApplicationRecord
  has_many :devices
  has_many :device_model_properties, dependent: :destroy
  has_many :raw_properties, dependent: :destroy

  belongs_to :brand
  belongs_to :model
  belongs_to :device_type

  has_many :device_property_values, as: :dynamic_property_model, dependent: :destroy 
  
  validates :name, presence: true, uniqueness: true
  
  accepts_nested_attributes_for :device_model_properties, allow_destroy: true
  accepts_nested_attributes_for :device_property_values, allow_destroy: true
end