require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  setup do
    @category = categories(:dragonkin)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create category" do
    assert_difference('Category.count') do
      post :create, params: { category: { blz_id: @category.blz_id, comments: @category.comments, decay_id: @category.decay_id, features: @category.features, icon_url: @category.icon_url, restrain_id: @category.restrain_id, title_cn: @category.title_cn, title_en: @category.title_en }}
    end

    assert_redirected_to category_path(assigns(:category))
  end

  test "should show category" do
    get :show, params: { id: @category }
    assert_response :success
  end

  test "should show category via friendly id" do
    get :show, params: { id: @category }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { id: @category }
    assert_response :success
  end

  test "should update category" do
    put :update, params: { id: @category, category: { blz_id: @category.blz_id, comments: @category.comments, decay_id: @category.decay_id, features: @category.features, icon_url: @category.icon_url, restrain_id: @category.restrain_id, title_cn: @category.title_cn, title_en: @category.title_en }}
    assert_redirected_to category_path(assigns(:category))
  end

  test "should destroy category" do
    assert_difference('Category.count', -1) do
      delete :destroy, params: { id: @category }
    end

    assert_redirected_to categories_path
  end
end
