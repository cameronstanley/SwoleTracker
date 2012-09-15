
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

  end

end
