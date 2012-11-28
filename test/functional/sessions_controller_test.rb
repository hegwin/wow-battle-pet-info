require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get logged in" do
    ashuram = users(:ashuram)
    post :create, {name: ashuram.name, password: "pswd"}
    assert_redirected_to pets_url
    assert_equal ashuram.id, session[:user_id]
  end
  
  test "should fail to login" do
    ashuram = users(:ashuram)
    post :create, {name: ashuram.name, password: "wrong"}
    assert_redirected_to login_url
  end

  test "should get logged out" do
    get :destroy
    assert_redirected_to login_url
    assert_equal nil, session[:user_id]
  end

end
