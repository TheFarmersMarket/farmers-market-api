json.farmer do
  json.id @farmer.id
  json.location @farmer.location
  json.business_phone @farmer.business_phone
  json.farm @farmer.farm
  json.crop_names @farmer.crop_names
  json.contact_name @farmer.contact_name
  json.user_id @farmer.user_id
end

json.avatar do 
    json.avatar @farmer.avatar.url(:medium)
end
