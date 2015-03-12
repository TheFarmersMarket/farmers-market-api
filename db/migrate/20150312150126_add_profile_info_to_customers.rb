class AddProfileInfoToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :business, :string
    add_column :customers, :business_phone, :string
    add_column :customers, :location, :string
    add_column :customers, :contact_name, :string 
  end
end
