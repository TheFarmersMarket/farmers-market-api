json.crops do
  json.array! @crops, :id, :farmer_id, :price, :currency, :quantity, :unit, :crop_name, :avatar 
end
