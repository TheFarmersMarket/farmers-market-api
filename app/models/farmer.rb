class Farmer < ActiveRecord::Base
  belongs_to :user
  has_many :crops
  has_many :orders
  has_many :customers, through: :orders
  include PgSearch
  multisearchable :against => [:business_phone, :farm, :crop_names, :contact_name]
  has_attached_file :avatar, :styles => { :large => "800x800", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment :avatar, :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }
  validates_with AttachmentSizeValidator, :attributes => :profile, :less_than => 2.megabytes
  validates_attachment_file_name :avatar, :matches => [/png\Z/, /jpe?g\Z/]

end
