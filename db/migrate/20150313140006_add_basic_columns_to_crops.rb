class AddBasicColumnsToCrops < ActiveRecord::Migration
  def change
    add_column :crops, :price, :decimal, precision: 10, scale: 2, default: 0.0
    add_column :crops, :currency, :string
    add_column :crops, :quantity, :integer
    add_column :crops, :crop_name, :string
  end
end
