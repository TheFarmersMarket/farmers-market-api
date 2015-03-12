class AddProfileInfoToFarmers < ActiveRecord::Migration
  def change
    add_column :farmers, :location, :string
    add_column :farmers, :business_phone, :string
    add_column :farmers, :farm, :string
    add_column :farmers, :crops, :text
    add_column :farmers, :contact_name, :string
  end
end
