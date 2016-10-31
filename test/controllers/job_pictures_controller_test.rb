require 'test_helper'

class JobPicturesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get job_pictures_index_url
    assert_response :success
  end

  test "should get show" do
    get job_pictures_show_url
    assert_response :success
  end

end
