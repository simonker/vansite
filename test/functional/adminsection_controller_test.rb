require 'test_helper'

class AdminsectionControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get createuser" do
    get :createuser
    assert_response :success
  end

end
