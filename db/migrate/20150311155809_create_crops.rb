class CreateCrops < ActiveRecord::Migration
  def change
    create_table :crops do |t|

      t.timestamps null: false
    end
  end
end
