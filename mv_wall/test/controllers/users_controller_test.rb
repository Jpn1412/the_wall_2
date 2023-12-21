require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get users_login_url
    assert_response :success
  end

  test "should get login_user" do
    get users_login_user_url
    assert_response :success
  end

  test "should get registration" do
    get users_registration_url
    assert_response :success
  end

  test "should get save_user" do
    get users_save_user_url
    assert_response :success
  end
end
