# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'
include Faker

50.times do 
  crop = Crop.create(
    :price => Commerce.price,
    :currency => "$USD",
    :quantity => Number.number(3))

  farmer = Farmer.create(
    :business_phone => PhoneNumber.phone_number,
    :farm => Company.name,
    :crop_names => "soy, wheat, corn",
    :location => Address.city,
    :contact_name => Name.name)

  customer = Customer.create(
    :business => Company.name,
    :business_phone => PhoneNumber.phone_number,
    :location => Address.city,
    :contact_name => Name.name)
end



