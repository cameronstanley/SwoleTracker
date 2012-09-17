
class HealthTrackerController < ApplicationController

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

    # Find today's health entry (if any)
    health_entries = HealthEntry.where(:date => @date, :user_id => @current_user.id)
    if health_entries.length > 0
      @health_entry = health_entries[0]
    else
      @health_entry = HealthEntry.new
    end

  end

  def track

    # Don't include the user id as a hidden element on form - don't want the user to modify it
    params[:health_entry][:user_id] = @current_user.id

    # Determine whether we need to create a new entry or update an existing entry
    @existing_entries = HealthEntry.where(:date => params[:health_entry][:date], :user_id => @current_user.id)
    if @existing_entries.length > 0
      if @existing_entries[0].update_attributes(params[:health_entry])
        flash[:notice] = "Health entry was successfully updated."
      else
        flash[:error] = "Error occurred saving health entry. Please try again."
      end
    else
      @entry = HealthEntry.new(params[:health_entry])
      if @entry.save
        flash[:notice] = "Health entry was successfully updated."
      else
        flash[:error] = "Error occurred saving health entry. Please try again."
      end
    end

    redirect_to :controller => :health_tracker, :action => :index, :date => params[:health_entry][:date]

  end

end
