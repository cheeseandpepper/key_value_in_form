require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test ".known_keys" do
    assert 4, Product.known_keys.count
  end
end
