class BoardsLocation < ApplicationRecord
  belongs_to :board
  belongs_to :location
end