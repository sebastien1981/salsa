require "test_helper"

class DancesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get dances_new_url
    assert_response :success
  end

  test "should get create" do
    get dances_create_url
    assert_response :success
  end
end
