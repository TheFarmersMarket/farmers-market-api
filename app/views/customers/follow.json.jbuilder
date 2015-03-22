json.follow do
  json.farmer_id @farmer.id 
  json.farmer_name @farmer.contact_name
  json.farmers_followers_count @farmer.followers_count
  json.customer_id @customer.id
  json.customer_name @customer.contact_name
  json.customer_follow_count @customer.follow_count
end 