require 'test_helper'

class UserAndLoginTest < ActionDispatch::IntegrationTest
  test "create the first user" do
    flunk
    User.delete_all
    assert_equal 0, User.count
    get '/users/new'
    assert_response :success
  end
end
