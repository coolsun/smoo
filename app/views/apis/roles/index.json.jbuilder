json.roles do
  json.array! @roles do |r|
    json.id    r.id
    json.name  r.name
    json.users r.users.map(&:name).join(',')
    json.site  r.resource_type.present? ? r.resource_type : '*'
  end  
end
