class Model < ApplicationRecord
  has_many :device_models

  validates :name, presence: true, uniqueness: true
end