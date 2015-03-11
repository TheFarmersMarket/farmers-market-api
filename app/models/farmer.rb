class Farmer < ActiveRecord::Base
  belongs_to :user
  has_many :crops
  has_many :orders
  has_many :customers, through: :orders
end
