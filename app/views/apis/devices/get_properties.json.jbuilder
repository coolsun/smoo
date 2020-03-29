json.device_properties do
  json.array! @device_properties, :id, :name, :type, :value, :normalize
end
