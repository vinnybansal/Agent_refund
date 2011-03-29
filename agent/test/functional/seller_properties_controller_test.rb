require 'test_helper'

class SellerPropertiesControllerTest < ActionController::TestCase
  setup do
    @seller_property = seller_properties(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:seller_properties)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create seller_property" do
    assert_difference('SellerProperty.count') do
      post :create, :seller_property => @seller_property.attributes
    end

    assert_redirected_to seller_property_path(assigns(:seller_property))
  end

  test "should show seller_property" do
    get :show, :id => @seller_property.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @seller_property.to_param
    assert_response :success
  end

  test "should update seller_property" do
    put :update, :id => @seller_property.to_param, :seller_property => @seller_property.attributes
    assert_redirected_to seller_property_path(assigns(:seller_property))
  end

  test "should destroy seller_property" do
    assert_difference('SellerProperty.count', -1) do
      delete :destroy, :id => @seller_property.to_param
    end

    assert_redirected_to seller_properties_path
  end
end
