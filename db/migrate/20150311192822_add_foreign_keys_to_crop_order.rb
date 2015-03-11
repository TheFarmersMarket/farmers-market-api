class AddForeignKeysToCropOrder < ActiveRecord::Migration
  def change
    add_column :crop_orders, :crop_id, :integer
    add_column :crop_orders, :order_id, :integer
  end
end
