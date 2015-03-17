class Customer < ActiveRecord::Base
  belongs_to :user
  has_many :orders
  has_many :farmers, through: :orders
  include PgSearch
  multisearchable :against => [:business, :business_phone, :location, :contact_name]
end

