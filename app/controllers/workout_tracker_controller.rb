
class WorkoutTrackerController < ApplicationController

  def index
    # Set to today's date if not already selected
    if params[:date].nil?
      @current_date = Date.today
    else
      @current_date = Date.parse(params[:date])
    end

  	# Get all entries for the selected date
  	entries = ExerciseEntry.where("date = ?", @current_date.to_s)

  	# Group exercises with associated exercise details for selected date
    @todays_entries = Hash.new
  	entries.each do |entry|
  		exercise = Exercise.find(entry.exercise_id)
  		exercise_detail = ExerciseDetail.find(entry.exercise_detail_id)

  		if @todays_entries[exercise].nil?
  			@todays_entries[exercise] = Array.new
  		end

  		@todays_entries[exercise] << exercise_detail
  	end

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
