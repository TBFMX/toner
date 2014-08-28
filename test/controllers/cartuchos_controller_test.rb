require 'test_helper'

class CartuchosControllerTest < ActionController::TestCase
  setup do
    @cartucho = cartuchos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cartuchos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cartucho" do
    assert_difference('Cartucho.count') do
      post :create, cartucho: { brand: @cartucho.brand, color: @cartucho.color, description: @cartucho.description, image_url: @cartucho.image_url, model: @cartucho.model, price: @cartucho.price, title: @cartucho.title }
    end

    assert_redirected_to cartucho_path(assigns(:cartucho))
  end

  test "should show cartucho" do
    get :show, id: @cartucho
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cartucho
    assert_response :success
  end

  test "should update cartucho" do
    patch :update, id: @cartucho, cartucho: { brand: @cartucho.brand, color: @cartucho.color, description: @cartucho.description, image_url: @cartucho.image_url, model: @cartucho.model, price: @cartucho.price, title: @cartucho.title }
    assert_redirected_to cartucho_path(assigns(:cartucho))
  end

  test "should destroy cartucho" do
    assert_difference('Cartucho.count', -1) do
      delete :destroy, id: @cartucho
    end

    assert_redirected_to cartuchos_path
  end
end
