json.device_model_properties do
  json.array! @device_model_properties, :id, :name, :kind, :unit, :gain, :address, :quantity, :count, :_destroy
end

json.properties_kinds DeviceModelProperty::KIND
json.properties_units DeviceModelProperty::UNIT