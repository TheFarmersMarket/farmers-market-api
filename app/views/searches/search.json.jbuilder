json.search @results do |result|
  if result.searchable.class == Crop
    json.farmer_id result.searchable.farmer.id
    json.contact_name result.searchable.farmer.contact_name
    json.farm result.searchable.farmer.farm
    json.url url_for(result.searchable)
  elsif result.searchable.class == Farmer
    json.farmer_id result.searchable.id
    json.contact_name result.searchable.contact_name
    json.farm result.searchable.farm
    json.url url_for(result.searchable)
  else result.searchable.class == Customer
    json.customer_id result.searchable.id
    json.contact_name result.searchable.contact_name
    json.business result.searchable.business
    json.url url_for(result.searchable) 
  end
end
