json.customer do
  json.business @customer.business
  json.business_phone @customer.business_phone
  json.location @customer.location
  json.contact_name @customer.contact_name
  json.user_id @customer.user_id
end

json.avatar do
  json.avatar @customer.avatar.url(:medium)
end
