class Board < ApplicationRecord
  has_many :boards_locations, dependent: :delete_all
  has_many :locations, through: :boards_locations

  belongs_to :site


  validates :name, presence: true, uniqueness: true
  validates :count, presence: true

end