
class WorkoutTrackerController < ApplicationController

  def index
  	@today = Date.today
  	@todays_entries = Hash.new

  	# Get all entries for the viewed date
  	entries = ExerciseEntry.where("date = ?", @today.to_s)

  	# Group exercises with associated exercise details
  	entries.each do |entry|
  		exercise = Exercise.find(entry.exercise_id)
  		exercise_detail = ExerciseDetail.find(entry.exercise_detail_id)

  		if @todays_entries[exercise].nil?
  			@todays_entries[exercise] = Array.new
  		end

  		@todays_entries[exercise] << exercise_detail
  	end

  	# Get list of all exercises
  	@exercises = Exercise.all
  end

  def track
    date = params[:date]
    exercise_id = params[:exercise]
    sets = params[:sets]
    reps = params[:reps]
    weight = params[:weight]

    exercise_detail = ExerciseDetail.new(:sets => sets, :reps => reps, :weight => weight)
    if exercise_detail.save
      ExerciseEntry.create(:exercise_detail_id => exercise_detail.id, :exercise_id => exercise_id, :date => date)
    end

    respond_to do |format|
      format.html { redirect_to "/workout_tracker/index", notice: 'Exercise entry was successfully created.' }
    end
  end

end
