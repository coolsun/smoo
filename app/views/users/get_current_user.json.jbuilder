json.user do
  json.email current_user.try(:email)
  json.name current_user.try(:name)
end