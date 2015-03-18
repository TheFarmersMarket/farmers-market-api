json.crop do
  json.id @crop.id
  json.price @crop.price
  json.currency @crop.currency
  json.quantity @crop.quantity
  json.crop_name @crop.crop_name
  json.farmer_id @crop.farmer_id
end
