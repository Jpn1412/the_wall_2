require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get save_comment" do
    get comments_save_comment_url
    assert_response :success
  end

  test "should get edit_page" do
    get comments_edit_page_url
    assert_response :success
  end

  test "should get update_comment" do
    get comments_update_comment_url
    assert_response :success
  end

  test "should get delete_comment" do
    get comments_delete_comment_url
    assert_response :success
  end
end
