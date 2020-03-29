json.users do
  json.role do
    json.array! @user_roles do |r|
      json.id r.id
      json.name r.name
      json.resource_type r.resource_type
      json.site do
        json.resource_id r.resource_id
      end
    end
  end
end
