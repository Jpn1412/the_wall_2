require "test_helper"

class BlogsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get blogs_index_url
    assert_response :success
  end

  test "should get get_messages_comments" do
    get blogs_get_messages_comments_url
    assert_response :success
  end

  test "should get logout" do
    get blogs_logout_url
    assert_response :success
  end
end
