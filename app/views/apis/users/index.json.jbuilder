json.users do
  json.array! @users do |u|
    json.id  u.id
    json.name u.name
    json.email u.email
    json.last_name u.last_name
    json.first_name u.first_name
    json.phone u.phone
    json.address u.address
    json.mobile_phone u.mobile_phone
    json.invoice_address u.invoice_address
    json.data_capacity_limit u.data_capacity_limit
    json.used_capacity u.used_capacity
    json.sex u.sex
    json.remain_point u.remain_point
    json.service u.service
    json.update_at u.update_at
    json.update_user u.update_user
    json.data_code u.data_code
    json.company_name u.company_name
    json.company_phone u.company_phone
    json.company_fax u.company_fax
    json.company_address_city u.company_address_city
    json.company_address_district u.company_address_district
    json.company_address_road u.company_address_road
  end  
end
