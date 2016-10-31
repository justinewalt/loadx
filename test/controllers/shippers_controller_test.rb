require 'test_helper'

class ShippersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shippers_index_url
    assert_response :success
  end

  test "should get show" do
    get shippers_show_url
    assert_response :success
  end

end
