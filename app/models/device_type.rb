class DeviceType < ApplicationRecord
  has_many :device_properties, dependent: :destroy

  has_many :normalization_properties, dependent: :destroy
  accepts_nested_attributes_for :normalization_properties, allow_destroy: true

  validates :name, presence: true, uniqueness: true
end