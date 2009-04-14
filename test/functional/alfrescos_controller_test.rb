require 'test_helper'

class AlfrescosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:alfrescos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create alfresco" do
    assert_difference('Alfresco.count') do
      post :create, :alfresco => { }
    end

    assert_redirected_to alfresco_path(assigns(:alfresco))
  end

  test "should show alfresco" do
    get :show, :id => alfrescos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => alfrescos(:one).to_param
    assert_response :success
  end

  test "should update alfresco" do
    put :update, :id => alfrescos(:one).to_param, :alfresco => { }
    assert_redirected_to alfresco_path(assigns(:alfresco))
  end

  test "should destroy alfresco" do
    assert_difference('Alfresco.count', -1) do
      delete :destroy, :id => alfrescos(:one).to_param
    end

    assert_redirected_to alfrescos_path
  end
end
