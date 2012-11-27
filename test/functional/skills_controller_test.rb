require 'test_helper'

class SkillsControllerTest < ActionController::TestCase
  setup do
    @skill = skills(:call_lightning)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:skills)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create skill" do
    assert_difference('Skill.count') do
      post :create, skill: { blz_id: @skill.blz_id + 50000, category_id: @skill.category_id, cd: @skill.cd, comments: @skill.comments, description: @skill.description, hit_rate: @skill.hit_rate, status: @skill.status, title_cn: @skill.title_cn, title_en: @skill.title_en }
    end

    assert_redirected_to skill_path(assigns(:skill))
  end

  test "should show skill" do
    get :show, id: @skill
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @skill
    assert_response :success
  end

  test "should update skill" do
    put :update, id: @skill, skill: { blz_id: @skill.blz_id, category_id: @skill.category_id, cd: @skill.cd, comments: @skill.comments, description: @skill.description, hit_rate: @skill.hit_rate, status: @skill.status, title_cn: @skill.title_cn, title_en: @skill.title_en }
    assert_redirected_to skill_path(assigns(:skill))
  end

  test "should destroy skill" do
    assert_difference('Skill.count', -1) do
      delete :destroy, id: @skill
    end

    assert_redirected_to skills_path
  end
end
