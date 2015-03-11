class CropOrder < ActiveRecord::Base
  belongs_to :crop
  belongs_to :order
end
