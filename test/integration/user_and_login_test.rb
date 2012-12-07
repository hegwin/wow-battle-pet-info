require 'test_helper'

class UserAndLoginTest < ActionDispatch::IntegrationTest
  test "a normal guest come" do
    pet = pets(:hatchling)
    get '/pets'
    assert_response :success
    assert_select 'div.admin-btn-panel', 0
    assert_select 'ul.nav li', 9
    get "pets/#{pet.id}"
    assert_response :success
  end
  
  test "an administrator's work flow" do
    admin = users(:ashuram)
    pet = pets(:hatchling)
    get "pets/#{pet.id}"
    assert_response :success
    assert_select 'div.page-header h1', /#{pet.title_cn}/
    assert_select 'div.admin-btn-panel', 0
    
    get "pets/#{pet.id}/edit"
    assert_redirected_to login_url
    
    post_via_redirect login_url, {name: "ashuram", password: "pswd"}
    assert_response :success
    assert_equal admin.id, session[:user_id]
    assert_select 'ul.nav li', 11
    assert_select 'div.admin-btn-panel'
    get "pets/#{pet.id}"
    assert_select 'div.admin-btn-panel'
    
    get "pets/#{pet.id}/edit"
    assert_response :success

    put_via_redirect pet_path(pet), id: pet, pet: {title_cn: pet.title_cn, reviewed: "0" }
    assert_response :success
    assert_select "div.page-header h1 label", "Unreviewed"

    delete_via_redirect "/logout"
    assert_response :success
    assert_equal nil, session[:user_id]
    get "/pets"
    assert_select "ul.nav li", 9
  end
end
