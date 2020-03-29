json.device_model do
  json.id  @device_model.id
  json.name @device_model.name
  json.device_type_id @device_model.device_type.id
  json.prop_values @device_model.device_property_values
end

json.device_types @device_types_data
json.brands @brands
json.models @models