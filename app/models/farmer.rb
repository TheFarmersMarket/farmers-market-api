class Farmer < ActiveRecord::Base
  belongs_to :user
  has_many :crops
  has_many :orders
  has_many :customers, through: :orders

  has_attached_file :avatar, styles: { :thumb => "200x200", :medium => "300x300" }

  validates_attachment :avatar, content_type: { :content_type => "image/jpeg"},
        size: { :in => 0..1.megabytes }
end
