json.location do 
  json.mppt_image_url @location.mppt_image_url
  json.devices do
    json.array! @mppt_devices do |d|
      json.id   d.id
      json.name d.name
      json.mppt_coordinates d.mppt_coordinates || []
    end
  end
end