require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  let(:product) { build(:product) }
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: { description: product.description, name: product.name, price: product.price, sku: product.sku }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    product.save
    get :show, id: product
    assert_response :success
  end

  test "should get edit" do
    product.save
    get :edit, id: product
    assert_response :success
  end

  test "should update product" do
    product.save
    patch :update, id: product, product: { description: product.description, name: product.name, price: product.price, sku: product.sku }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    product.save!
    product.reload
    assert_difference('Product.count', -1) do
      delete :destroy, id: product
    end

    assert_redirected_to products_path
  end
end
