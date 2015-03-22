json.crops do
  json.farmer_id @crops.farmer_id
  json.price @crops.price
  json.currency @crops.currency
  json.quantity @crops.quantity
  json.crop_name @crops.crop_name
end

json.avatar do
  json.avatar @crops.avatar.url(:medium)
end
