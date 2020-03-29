json.boards do
  json.array! @boards, :id, :name, :count
end