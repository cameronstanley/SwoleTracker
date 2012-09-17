
class ExerciseDetailsController < ApplicationController

  before_filter :require_user

  # GET /exercise_details
  # GET /exercise_details.json
  def index
    @exercise_details = ExerciseDetail.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @exercise_details }
    end
  end

  # GET /exercise_details/1
  # GET /exercise_details/1.json
  def show
    @exercise_detail = ExerciseDetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @exercise_detail }
    end
  end

  # GET /exercise_details/new
  # GET /exercise_details/new.json
  def new
    @exercise_detail = ExerciseDetail.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @exercise_detail }
    end
  end

  # GET /exercise_details/1/edit
  def edit
    @exercise_detail = ExerciseDetail.find(params[:id])
    @date = params[:date]
  end

  # POST /exercise_details
  # POST /exercise_details.json
  def create
    @exercise_detail = ExerciseDetail.new(params[:exercise_detail])

    respond_to do |format|
      if @exercise_detail.save
        format.html { redirect_to @exercise_detail, notice: 'Exercise detail was successfully created.' }
        format.json { render json: @exercise_detail, status: :created, location: @exercise_detail }
      else
        format.html { render action: "new" }
        format.json { render json: @exercise_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /exercise_details/1
  # PUT /exercise_details/1.json
  def update
    @exercise_detail = ExerciseDetail.find(params[:id])

    date = params[:date]

    respond_to do |format|
      if @exercise_detail.update_attributes(params[:exercise_detail])
        format.html { redirect_to (url_for :controller => 'workout_tracker', :action => 'index', :date => date), notice: 'Exercise detail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @exercise_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exercise_details/1
  # DELETE /exercise_details/1.json
  def destroy
    @exercise_detail = ExerciseDetail.find(params[:id])
    @exercise_detail.destroy

    exercise_entries = ExerciseEntry.where(:exercise_detail_id => params[:id])
    exercise_entries.each do |entry|
      entry.destroy
    end

    date = params[:date]

    respond_to do |format|
      format.html { redirect_to (url_for :controller => 'workout_tracker', :action => 'index', :date => date), :notice => 'Exercise detail was sucessfully deleted.' }
      format.json { head :no_content }
    end
  end
end
