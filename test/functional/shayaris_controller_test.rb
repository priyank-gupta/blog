require 'test_helper'

class ShayarisControllerTest < ActionController::TestCase
  setup do
    @shayari = shayaris(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shayaris)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shayari" do
    assert_difference('Shayari.count') do
      post :create, :shayari => @shayari.attributes
    end

    assert_redirected_to shayari_path(assigns(:shayari))
  end

  test "should show shayari" do
    get :show, :id => @shayari.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @shayari.to_param
    assert_response :success
  end

  test "should update shayari" do
    put :update, :id => @shayari.to_param, :shayari => @shayari.attributes
    assert_redirected_to shayari_path(assigns(:shayari))
  end

  test "should destroy shayari" do
    assert_difference('Shayari.count', -1) do
      delete :destroy, :id => @shayari.to_param
    end

    assert_redirected_to shayaris_path
  end
end
