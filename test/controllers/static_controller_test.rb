require 'test_helper'

class StaticControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get static_search_url
    assert_response :success
  end

end
