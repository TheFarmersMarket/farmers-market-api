class AddTempPasswordToUsers < ActiveRecord::Migration
  def change
    add_column :users, :temp_password, :boolean
  end
end
