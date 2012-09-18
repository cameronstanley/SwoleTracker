
class DashboardController < ApplicationController

	before_filter :require_user

  def index
  	@date = Date.today

  	@exercise_entries_today = ExerciseEntry.where(:date => @date, :user_id => @current_user.id).count
  	@exercise_entries_total = ExerciseEntry.where(:user_id => @current_user.id).count

  	@health_entries_today = HealthEntry.where(:date => @date, :user_id => @current_user.id).count
  	@health_entries_total = HealthEntry.where(:user_id => @current_user.id).count
  end

end
