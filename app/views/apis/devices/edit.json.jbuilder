json.device do 
  json.id               @device.id
  json.name             @device.name
  json.parent_device_id @device.parent.try(:id)
  json.device_model_id  @device.device_model_id
  json.location_id      @device.location_id
end

json.locations @locations, :id, :name
json.device_models @device_models, :id, :name
json.devices @devices, :id, :name