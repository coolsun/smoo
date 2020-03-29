class ErrorLog < ApplicationRecord
  belongs_to :location, optional: true
end