require 'test_helper'

class ExerciseDetailsControllerTest < ActionController::TestCase
  setup do
    @exercise_detail = exercise_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:exercise_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create exercise_detail" do
    assert_difference('ExerciseDetail.count') do
      post :create, exercise_detail: { reps: @exercise_detail.reps, sets: @exercise_detail.sets, weight: @exercise_detail.weight }
    end

    assert_redirected_to exercise_detail_path(assigns(:exercise_detail))
  end

  test "should show exercise_detail" do
    get :show, id: @exercise_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @exercise_detail
    assert_response :success
  end

  test "should update exercise_detail" do
    put :update, id: @exercise_detail, exercise_detail: { reps: @exercise_detail.reps, sets: @exercise_detail.sets, weight: @exercise_detail.weight }
    assert_redirected_to exercise_detail_path(assigns(:exercise_detail))
  end

  test "should destroy exercise_detail" do
    assert_difference('ExerciseDetail.count', -1) do
      delete :destroy, id: @exercise_detail
    end

    assert_redirected_to exercise_details_path
  end
end
