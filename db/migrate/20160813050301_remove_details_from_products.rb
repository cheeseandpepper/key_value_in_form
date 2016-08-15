class RemoveDetailsFromProducts < ActiveRecord::Migration
  def up
    remove_column :products, :details
  end

  def down
    add_column :products, :details, :jsonb, null: false, default: '{}'
    add_index  :products, :details, using: :gin
  end
end
