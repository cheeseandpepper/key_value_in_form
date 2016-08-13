class AddDetailsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :details, :jsonb, null: false, default: '{}'
    add_index  :products, :details, using: :gin
  end
end
