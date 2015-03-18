class AddAvatarToCustomerTable < ActiveRecord::Migration
  def self.up
    add_attachment :customers, :avatar
  end

  def self.down
    remove_attachment :customers, :avatar
  end
end
