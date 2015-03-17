class Farmer < ActiveRecord::Base
  belongs_to :user
  has_many :crops
  has_many :orders
  has_many :customers, through: :orders
  inlcude PgSearch
  multisearchable :against => [:business_phone, :farm, :crop_names, :contact_name]
end
