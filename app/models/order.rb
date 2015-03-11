class Order < ActiveRecord::Base
  has_many :crops, through: :crop_orders
  has_many :crop_orders
  belongs_to :farmer
  belongs_to :customer
end
