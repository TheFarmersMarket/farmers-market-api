json.user do
  json.extract! @user, :id, :email, :authentication_token, :profile_type
  if @user.profile_type == "customer"
    json.customer_id @user.customer.id
  elsif @user.profile_type == "farmer"
    json.farmer_id @user.farmer.id
  end
 end
