require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  let(:product) { FactoryGirl.create(:product) }
  let(:property_1) { FactoryGirl.create(:property, product_id: product.id, name: 'name 1', value: 'hello') }
  let(:property_2) { FactoryGirl.create(:property, product_id: product.id, name: 'name 2', value: 'hi there') }

  test "#unique_keys" do
    product.properties << [ property_1, property_2 ]
    
    assert 2, product.unique_keys.count
  end
end
