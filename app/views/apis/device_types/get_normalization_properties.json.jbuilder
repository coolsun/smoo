json.device_type do
  json.normalization_properties do
    json.array! @normalization_properties, :id, :name, :kind, :unit, :required, :_destroy
  end
end

json.kinds NormalizationProperty::KIND
json.units NormalizationProperty::UNIT