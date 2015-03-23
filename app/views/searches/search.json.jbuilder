json.search @results do |result|
  if result.searchable.class == Crop
    json.farmer_id result.searchable.farmer.id
    json.contact_name result.searchable.farmer.contact_name
    json.farm result.searchable.farmer.farm
    json.crop_name result.searchable.crop_name
    json.price result.searchable.price
    json.quantity result.searchable.quantity
    json.unit result.searchable.unit
    json.url url_for(result.searchable)
  elsif result.searchable.class == Farmer
    json.farmer_id result.searchable.id
    json.contact_name result.searchable.contact_name
    json.business_phone result.searchable.business_phone
    json.location result.searchable.location
    json.farm result.searchable.farm
    json.crop_names result.searchable.crop_names
    json.url url_for(result.searchable)
  else result.searchable.class == Customer
    json.customer_id result.searchable.id
    json.contact_name result.searchable.contact_name
    json.business_phone result.searchable.business_phone
    json.location result.searchable.location
    json.business result.searchable.business
    json.url url_for(result.searchable) 
  end
end
