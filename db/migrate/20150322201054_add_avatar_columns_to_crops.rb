class AddAvatarColumnsToCrops < ActiveRecord::Migration
  def self.up
    add_attachment :crops, :avatar
  end

  def self.down
    remove_attachment :crops, :avatar
  end
end
