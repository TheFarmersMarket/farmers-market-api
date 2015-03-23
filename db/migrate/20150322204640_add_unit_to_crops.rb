class AddUnitToCrops < ActiveRecord::Migration
  def change
    add_column :crops, :unit, :string
  end
end
