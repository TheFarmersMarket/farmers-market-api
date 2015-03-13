json.user do
  json.id @user.id
  json.email @user.email
  json.authentication_token @user.authentication_token
  json.profile_type @user.profile_type
  if @user.profile_type == "customer"
    json.customer_id @user.customer.id
  elsif @user.profile_type == "farmer"
    json.farmer_id @user.farmer.id
  end
 end

