json.board do
  json.locations do 
    json.array! @board.boards_locations.includes(:location).map do |bl|
      json.location_id bl.location_id
      json.name bl.location.name
      json.index bl.index
    end
  end
end