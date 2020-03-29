class SitesLocation < ApplicationRecord
  belongs_to :site
  belongs_to :location
end