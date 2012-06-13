require 'test_helper'

class BranchtestsControllerTest < ActionController::TestCase
  setup do
    @branchtest = branchtests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:branchtests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create branchtest" do
    assert_difference('Branchtest.count') do
      post :create, branchtest: { branch: @branchtest.branch, name: @branchtest.name }
    end

    assert_redirected_to branchtest_path(assigns(:branchtest))
  end

  test "should show branchtest" do
    get :show, id: @branchtest
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @branchtest
    assert_response :success
  end

  test "should update branchtest" do
    put :update, id: @branchtest, branchtest: { branch: @branchtest.branch, name: @branchtest.name }
    assert_redirected_to branchtest_path(assigns(:branchtest))
  end

  test "should destroy branchtest" do
    assert_difference('Branchtest.count', -1) do
      delete :destroy, id: @branchtest
    end

    assert_redirected_to branchtests_path
  end
end
