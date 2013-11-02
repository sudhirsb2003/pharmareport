require 'test_helper'

class TabUsersControllerTest < ActionController::TestCase
  setup do
    @tab_user = tab_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tab_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tab_user" do
    assert_difference('TabUser.count') do
      post :create, tab_user: { address: @tab_user.address, employee_uid: @tab_user.employee_uid, name: @tab_user.name }
    end

    assert_redirected_to tab_user_path(assigns(:tab_user))
  end

  test "should show tab_user" do
    get :show, id: @tab_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tab_user
    assert_response :success
  end

  test "should update tab_user" do
    patch :update, id: @tab_user, tab_user: { address: @tab_user.address, employee_uid: @tab_user.employee_uid, name: @tab_user.name }
    assert_redirected_to tab_user_path(assigns(:tab_user))
  end

  test "should destroy tab_user" do
    assert_difference('TabUser.count', -1) do
      delete :destroy, id: @tab_user
    end

    assert_redirected_to tab_users_path
  end
end
