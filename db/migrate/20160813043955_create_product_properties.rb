class CreateProductProperties < ActiveRecord::Migration
  def change
    create_table :product_properties do |t|
      t.integer    :product_id
      t.string     :name
      t.string     :value
    end

    add_index  :product_properties, :name
    add_index  :product_properties, :value
  end
end
