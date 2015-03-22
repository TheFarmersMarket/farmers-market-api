json.crops do
  json.array! @crops, :id, :farmer_id, :price, :currency, :quantity, :crop_name
end
