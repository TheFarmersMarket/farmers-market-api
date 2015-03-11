class Customer < ActiveRecord::Base
  belongs_to :user
  has_many :orders
  has_many :farmers, through: :orders
end
