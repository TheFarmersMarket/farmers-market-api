class Crop < ActiveRecord::Base
  belongs_to :farmer
  has_many :crop_orders
  has_many :orders, through: :crop_orders
  include PgSearch
  multisearchable :against => [:crop_name]

  has_attached_file :avatar, :styles => { :large => "800x800", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment :avatar, :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }
  validates_with AttachmentSizeValidator, :attributes => :avatar, :less_than => 2.megabytes
  validates_attachment_file_name :avatar, :matches => [/png\Z/, /jpe?g\Z/]
end
