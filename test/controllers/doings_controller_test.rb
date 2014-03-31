require 'test_helper'

class DoingsControllerTest < ActionController::TestCase
  setup do
    @doing = doings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:doings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create doing" do
    assert_difference('Doing.count') do
      post :create, doing: { cover: @doing.cover, name: @doing.name }
    end

    assert_redirected_to doing_path(assigns(:doing))
  end

  test "should show doing" do
    get :show, id: @doing
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @doing
    assert_response :success
  end

  test "should update doing" do
    patch :update, id: @doing, doing: { cover: @doing.cover, name: @doing.name }
    assert_redirected_to doing_path(assigns(:doing))
  end

  test "should destroy doing" do
    assert_difference('Doing.count', -1) do
      delete :destroy, id: @doing
    end

    assert_redirected_to doings_path
  end
end
