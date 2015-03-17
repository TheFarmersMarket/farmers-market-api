class Crop < ActiveRecord::Base
  belongs_to :farmer
  has_many :crop_orders
  has_many :orders, through: :crop_orders
  include PgSearch
  multisearchable :against => [:price, :crop_orders, :quantity, :crop_name]
end




