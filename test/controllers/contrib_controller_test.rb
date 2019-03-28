require 'test_helper'

class ContribControllerTest < ActionDispatch::IntegrationTest
  test "should get choose" do
    get contrib_choose_url
    assert_response :success
  end

end
