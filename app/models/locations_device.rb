class LocationsDevice < ApplicationRecord
  belongs_to :location
  belongs_to :device
end