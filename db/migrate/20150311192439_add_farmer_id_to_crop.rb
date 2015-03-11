class AddFarmerIdToCrop < ActiveRecord::Migration
  def change
    add_column :crops, :farmer_id, :integer
  end
end
