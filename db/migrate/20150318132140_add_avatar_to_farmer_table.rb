class AddAvatarToFarmerTable < ActiveRecord::Migration
  def self.up
    add_attachment :farmers, :avatar
  end

  def self.down
    remove_attachment :farmers, :avatar
  end
end
