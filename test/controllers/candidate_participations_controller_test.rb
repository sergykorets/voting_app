require 'test_helper'

class CandidateParticipationsControllerTest < ActionController::TestCase
  setup do
    @candidate_participation = candidate_participations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:candidate_participations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create candidate_participation" do
    assert_difference('CandidateParticipation.count') do
      post :create, candidate_participation: { candidate_id: @candidate_participation.candidate_id, description: @candidate_participation.description, visions: @candidate_participation.visions, votes: @candidate_participation.votes }
    end

    assert_redirected_to candidate_participation_path(assigns(:candidate_participation))
  end

  test "should show candidate_participation" do
    get :show, id: @candidate_participation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @candidate_participation
    assert_response :success
  end

  test "should update candidate_participation" do
    patch :update, id: @candidate_participation, candidate_participation: { candidate_id: @candidate_participation.candidate_id, description: @candidate_participation.description, visions: @candidate_participation.visions, votes: @candidate_participation.votes }
    assert_redirected_to candidate_participation_path(assigns(:candidate_participation))
  end

  test "should destroy candidate_participation" do
    assert_difference('CandidateParticipation.count', -1) do
      delete :destroy, id: @candidate_participation
    end

    assert_redirected_to candidate_participations_path
  end
end
