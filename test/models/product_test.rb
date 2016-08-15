require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "#unique_keys" do
    product             = Product.first
    product.properties << [ Property.first, Property.last ]
    
    assert 2, product.unique_keys.count
  end
end
