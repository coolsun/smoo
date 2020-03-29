json.role do
  json.id  @r.id
  json.name @r.name
  json.unselected_actions @unselected_actions
  json.selected_actions @selected_actions
end