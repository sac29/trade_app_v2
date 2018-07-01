require 'test_helper'

class LikeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get like_index_url
    assert_response :success
  end

end
