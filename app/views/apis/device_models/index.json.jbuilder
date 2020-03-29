json.device_models do
  json.array! @device_models do |d|
    json.id d.id
    json.name d.name
    json.normalize_json  d.normalize_json
    json.normalize_function  d.normalize_function
  end  
end