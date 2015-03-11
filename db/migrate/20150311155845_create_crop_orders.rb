class CreateCropOrders < ActiveRecord::Migration
  def change
    create_table :crop_orders do |t|

      t.timestamps null: false
    end
  end
end
