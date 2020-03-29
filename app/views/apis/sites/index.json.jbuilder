json.sites do
  json.array! @sites do |s|
    json.id    s.id
    json.name  s.name
  end  
end
