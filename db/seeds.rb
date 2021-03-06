# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "faker"
include Faker

def create_farmer
  @user = User.create({
    :email => Internet.email,
    :password => "password",
    :profile_type => "farmer"
    })
  @user.farmer = Farmer.create({
    :business_phone => PhoneNumber.phone_number,
    :farm => Company.name,
    :crop_names => "soy, wheat, peaches, peanuts, pecans",
    :location => Address.city,
    :contact_name => Name.name,
    :user_id => rand(1..50)
    })
end

def create_customer
  @user = User.create({
    :email => Internet.email,
    :password => "password",
    :profile_type => "customer"
    })
  @user.customer = Customer.create({
    :business => Company.name,
    :business_phone => PhoneNumber.phone_number,
    :location => Address.city,
    :contact_name => Name.name,
    :user_id => rand(1..50)
    })
end

30.times { create_farmer }
30.times { create_customer }


30.times do 
  crop = Crop.create(
    :price => Commerce.price,
    :currency => "$USD",
    :quantity => Number.number(3), 
    :farmer_id => rand(1..50)
    )
end



