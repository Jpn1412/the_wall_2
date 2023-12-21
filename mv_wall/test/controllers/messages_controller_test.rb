require "test_helper"

class MessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get save_message" do
    get messages_save_message_url
    assert_response :success
  end

  test "should get edit_page" do
    get messages_edit_page_url
    assert_response :success
  end

  test "should get update_message" do
    get messages_update_message_url
    assert_response :success
  end

  test "should get delete_message" do
    get messages_delete_message_url
    assert_response :success
  end
end
