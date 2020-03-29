class NormalizationProperty < ApplicationRecord
  KIND = ['int', 'float', 'string']
  UNIT = ['V', 'A', 'W', 'KW', 'KWH', 'HZ', 'mA', 'c', 'RPM', 'W/m2', '%', 'Hr']

  belongs_to :device_type
  has_many :normalization_property_values, dependent: :destroy

  validates :name,     presence: true, uniqueness: {scope: :device_type}
  validates :kind,     presence: true, inclusion: KIND
  validates :unit,     presence: true, inclusion: UNIT
  validates :required, presence: true
end