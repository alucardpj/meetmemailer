require 'test_helper'

class MailconfigsControllerTest < ActionController::TestCase
  setup do
    @mailconfig = mailconfigs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mailconfigs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mailconfig" do
    assert_difference('Mailconfig.count') do
      post :create, mailconfig: { address: @mailconfig.address, authentication: @mailconfig.authentication, delivery_method: @mailconfig.delivery_method, password: @mailconfig.password, port: @mailconfig.port, user_name: @mailconfig.user_name }
    end

    assert_redirected_to mailconfig_path(assigns(:mailconfig))
  end

  test "should show mailconfig" do
    get :show, id: @mailconfig
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mailconfig
    assert_response :success
  end

  test "should update mailconfig" do
    put :update, id: @mailconfig, mailconfig: { address: @mailconfig.address, authentication: @mailconfig.authentication, delivery_method: @mailconfig.delivery_method, password: @mailconfig.password, port: @mailconfig.port, user_name: @mailconfig.user_name }
    assert_redirected_to mailconfig_path(assigns(:mailconfig))
  end

  test "should destroy mailconfig" do
    assert_difference('Mailconfig.count', -1) do
      delete :destroy, id: @mailconfig
    end

    assert_redirected_to mailconfigs_path
  end
end
