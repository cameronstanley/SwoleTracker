
class WorkoutTrackerController < ApplicationController

  before_filter :require_user

  def index

  	# Default to today's date if none specified in params
  	if params[:date].nil?
  		@date = Date.today
  	else
      # Make sure passed date is valid; if not, default to today's date
      begin
        Date.parse(params[:date])
  		  @date = Date.parse(params[:date])
      rescue
        @date = Date.today
      end
  	end

    # Get exercise entries for date
  	entries = ExerciseEntry.where(:date => @date, :user_id => @current_user.id)

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

  end

	def track

    errors = Array.new

    # Validate exercise
    if Exercise.exists?(params[:exercise]) 
      exercise = Exercise.find(params[:exercise])
    else
      # Exercise couldn't be found or wasn't selected
      errors << "No exercise selected."
    end

    # Skip if previous errors
    if (errors.length == 0)

      # Create exercise detail
  		exercise_detail = ExerciseDetail.new(:sets => params[:sets], :reps => params[:reps], :weight => params[:weight])
      if exercise_detail.save

        # Create exercise entry
  		  exercise_entry = ExerciseEntry.new(:date => params[:date], :exercise_id => exercise.id, :exercise_detail_id => exercise_detail.id, :user_id => @current_user.id) 
        if !exercise_entry.save

          # Exercise entry could not be created; destroy previously created exercise detail
          exercise_detail.destroy(exercise_detail)
          exercise_entry.errors.full_messages.each {|msg| errors << msg}
        end

      else
        # Exercise detail could not be created
        exercise_detail.errors.full_messages.each {|msg| errors << msg} 
  		end
    end

    flash[:errors] = errors
    redirect_to :controller => :workout_tracker, :action => :index, :date => params[:date]

  end

end
