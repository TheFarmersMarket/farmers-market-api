class AddForeignKeysToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :farmer_id, :integer
    add_column :orders, :customer_id, :integer
  end
end
