json.board do
  json.count @board.count
  json.carousel_second @board.carousel_second
  
  json.locations do
    json.array! @data 
  end
end