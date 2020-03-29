class NormalizationPropertyValue < ApplicationRecord
  belongs_to :normalization_property
  belongs_to :device

  validates :value, presence: true
end