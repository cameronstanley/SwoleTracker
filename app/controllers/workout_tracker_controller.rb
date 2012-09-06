
class WorkoutTrackerController < ApplicationController

  def index

  	# Default to today's date if none specified in params
  	if params[:date].nil?
  		@date = Date.today
  	else
      # Make sure date is valid; if not, default to today's date
      begin
        Date.parse(params[:date])
  		  @date = Date.parse(params[:date])
      rescue
        @date = Date.today
      end
  	end

    # Get exercise entries for date
  	entries = ExerciseEntry.where("date = ?", @date.to_s)

    # Gather exercise entries for date in hash; key is the exercise and value is an array of associated exercise details
    @exercise_entries = Hash.new
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

		redirect_to :controller => :workout_tracker, :action => :index, :date => params[:date]
  end

end
