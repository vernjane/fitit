require 'test_helper'

class MallsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get malls_index_url
    assert_response :success
  end

  test "should get show" do
    get malls_show_url
    assert_response :success
  end

end
