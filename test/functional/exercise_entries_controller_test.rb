require 'test_helper'

class ExerciseEntriesControllerTest < ActionController::TestCase
  setup do
    @exercise_entry = exercise_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:exercise_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create exercise_entry" do
    assert_difference('ExerciseEntry.count') do
      post :create, exercise_entry: { date: @exercise_entry.date, exercise_detail_id: @exercise_entry.exercise_detail_id, exercise_id: @exercise_entry.exercise_id }
    end

    assert_redirected_to exercise_entry_path(assigns(:exercise_entry))
  end

  test "should show exercise_entry" do
    get :show, id: @exercise_entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @exercise_entry
    assert_response :success
  end

  test "should update exercise_entry" do
    put :update, id: @exercise_entry, exercise_entry: { date: @exercise_entry.date, exercise_detail_id: @exercise_entry.exercise_detail_id, exercise_id: @exercise_entry.exercise_id }
    assert_redirected_to exercise_entry_path(assigns(:exercise_entry))
  end

  test "should destroy exercise_entry" do
    assert_difference('ExerciseEntry.count', -1) do
      delete :destroy, id: @exercise_entry
    end

    assert_redirected_to exercise_entries_path
  end
end
