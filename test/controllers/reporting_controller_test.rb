require 'test_helper'

class ReportingControllerTest < ActionController::TestCase
  test "should get reporting" do
    get :reporting
    assert_response :success
  end

end
