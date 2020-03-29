class Site < ApplicationRecord
  resourcify

  has_many :sites_locations
  has_many :locations, through: :sites_locations
  has_many :boards, dependent: :destroy

  validates :name, presence: true, uniqueness: true

end
