json.follow do
  json.message "Customer no longer follow farmer"
  json.customer_id @customer.id
  json.customer_name @customer.contact_name
  json.customer_follow_count @customer.follow_count
end 