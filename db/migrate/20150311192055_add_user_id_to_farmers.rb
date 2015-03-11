class AddUserIdToFarmers < ActiveRecord::Migration
  def change
    add_column :farmers, :user_id, :integer
  end
end
