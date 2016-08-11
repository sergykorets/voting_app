require 'test_helper'

class ElectionPartsControllerTest < ActionController::TestCase
  setup do
    @election_part = election_parts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:election_parts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create election_part" do
    assert_difference('ElectionPart.count') do
      post :create, election_part: {  }
    end

    assert_redirected_to election_part_path(assigns(:election_part))
  end

  test "should show election_part" do
    get :show, id: @election_part
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @election_part
    assert_response :success
  end

  test "should update election_part" do
    patch :update, id: @election_part, election_part: {  }
    assert_redirected_to election_part_path(assigns(:election_part))
  end

  test "should destroy election_part" do
    assert_difference('ElectionPart.count', -1) do
      delete :destroy, id: @election_part
    end

    assert_redirected_to election_parts_path
  end
end
