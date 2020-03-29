json.devices do
  json.array! @devices do |d|
    json.id            d.id
    json.device_model  d.device_model.name if d.device_model.present?
    json.location_name d.location.name if d.location.present?
    json.name          d.name
  end  
end
