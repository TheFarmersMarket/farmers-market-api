class CreateFarmers < ActiveRecord::Migration
  def change
    create_table :farmers do |t|

      t.timestamps null: false
    end
  end
end
