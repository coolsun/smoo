json.locations do
  json.array! @locations,  :id, :code, :name, :city, 
                           :status, :daily_power, :total_power, :total_device, :average_sunshine_index, 
                           :goal_pr, :formate_time
end
