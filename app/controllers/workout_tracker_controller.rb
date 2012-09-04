
class WorkoutTrackerController < ApplicationController

  def index

  	# Default to today's date if none specified in params
  	if params[:date].nil?
  		@date = Date.today
  	else
  		@date = Date.parse(params[:date])
  	end

  	# Get exercise entries for date
  	@exercise_entries = Hash.new
  	entries = ExerciseEntry.where("date = ?", @date.to_s)
  	entries.each do |entry|
  		exercise = Exercise.find(entry.exercise_id)
  		exercise_detail = ExerciseDetail.find(entry.exercise_detail_id)
  		if @exercise_entries[exercise].nil?
  			@exercise_entries[exercise] = Array.new
  		end
  		@exercise_entries[exercise] << exercise_detail
  	end

  	# Get list of exercises
  	@exercises = Exercise.all

  	# Create new exercise entry
  	@new_exercise_entry = ExerciseEntry.new

  end

	def track
		exercise = Exercise.find(params[:exercise])
		exercise_detail = ExerciseDetail.new(:sets => params[:sets], :reps => params[:reps], :weight => params[:weight])

		if exercise_detail.save
			exercise_entry = ExerciseEntry.new(:date => params[:date], :exercise_id => exercise.id, :exercise_detail_id => exercise_detail.id)
			exercise_entry.save
		end

		redirect_to :controller => :workout_tracker, :action => :index
  end

end
