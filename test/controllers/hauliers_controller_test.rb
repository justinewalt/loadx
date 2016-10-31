require 'test_helper'

class HauliersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hauliers_index_url
    assert_response :success
  end

  test "should get show" do
    get hauliers_show_url
    assert_response :success
  end

end
