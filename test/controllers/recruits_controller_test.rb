require 'test_helper'

class RecruitsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get recruits_new_url
    assert_response :success
  end

end
