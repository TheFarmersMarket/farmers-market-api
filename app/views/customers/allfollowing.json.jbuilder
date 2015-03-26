json.all_following @results do |result|
  json.farmer_id result.id
  json.farm result.farm
  json.contact_name result.contact_name
end
