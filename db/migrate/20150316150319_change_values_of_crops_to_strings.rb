class ChangeValuesOfCropsToStrings < ActiveRecord::Migration
  def change
    change_column :crops, :price, :string
    change_column :crops, :quantity, :string
  end
end
