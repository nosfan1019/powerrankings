require 'test_helper'

class RelocatesControllerTest < ActionController::TestCase
  setup do
    @relocate = relocates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:relocates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create relocate" do
    assert_difference('Relocate.count') do
      post :create, relocate: { name: @relocate.name, team_id: @relocate.team_id }
    end

    assert_redirected_to relocate_path(assigns(:relocate))
  end

  test "should show relocate" do
    get :show, id: @relocate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @relocate
    assert_response :success
  end

  test "should update relocate" do
    put :update, id: @relocate, relocate: { name: @relocate.name, team_id: @relocate.team_id }
    assert_redirected_to relocate_path(assigns(:relocate))
  end

  test "should destroy relocate" do
    assert_difference('Relocate.count', -1) do
      delete :destroy, id: @relocate
    end

    assert_redirected_to relocates_path
  end
end
