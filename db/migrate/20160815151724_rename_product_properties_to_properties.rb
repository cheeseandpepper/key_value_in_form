class RenameProductPropertiesToProperties < ActiveRecord::Migration
  def change
    rename_table :product_properties, :properties
  end
end
