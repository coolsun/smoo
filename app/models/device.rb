class Device < ApplicationRecord
  belongs_to :location, optional: true
  belongs_to :device_model 
  MPPT = 'module'

  has_many :device_property_values, as: :dynamic_property_model, dependent: :destroy 
  has_many :normalization_property_values, dependent: :destroy 
  
  validates :name, presence: true, uniqueness: true

  has_ancestry

  serialize :mppt_coordinates, JSON

  def self.mppt_devices
    joins(device_model: [:device_type]).where('device_types.name = ?', MPPT).references(:device_type)
  end
end