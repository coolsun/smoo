json.error_log do 
 json.array! @location_logs do |l|
    json.location_id  l.location_id
    json.error_source l.error_source
    json.log_type     l.log_type
    json.log          l.log
  end
end
