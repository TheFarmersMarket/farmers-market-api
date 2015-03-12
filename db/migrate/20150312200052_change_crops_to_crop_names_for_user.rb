class ChangeCropsToCropNamesForUser < ActiveRecord::Migration
  def change
    rename_column :farmers, :crops, :crop_names
  end
end
