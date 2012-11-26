require 'test_helper'

class ZonesControllerTest < ActionController::TestCase
  setup do
    @zone = zones(:grey_valley)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:zones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create zone" do
    assert_difference('Zone.count') do
      post :create, zone: { blz_id: @zone.blz_id, description: @zone.description, parent_id: @zone.parent_id, title_cn: @zone.title_cn, title_en: @zone.title_en }
    end

    assert_redirected_to zone_path(assigns(:zone))
  end

  test "should show zone" do
    get :show, id: @zone
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @zone
    assert_response :success
  end

  test "should update zone" do
    put :update, id: @zone, zone: { blz_id: @zone.blz_id, description: @zone.description, parent_id: @zone.parent_id, title_cn: @zone.title_cn, title_en: @zone.title_en }
    assert_redirected_to zone_path(assigns(:zone))
  end

  test "should destroy zone" do
    assert_difference('Zone.count', -1) do
      delete :destroy, id: @zone
    end

    assert_redirected_to zones_path
  end
end
