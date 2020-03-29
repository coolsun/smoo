json.user do
  json.id  @user.id
  json.name @user.name
  json.email @user.email
  json.last_name @user.last_name
  json.first_name @user.first_name
  json.phone @user.phone
  json.address @user.address
  json.mobile_phone @user.mobile_phone
  json.invoice_address @user.invoice_address
  json.sex @user.sex
  json.company_name @user.company_name
  json.company_phone @user.company_phone
  json.company_fax @user.company_fax
  json.company_address_city @user.company_address_city
  json.company_address_district @user.company_address_district
  json.company_address_road @user.company_address_road
end