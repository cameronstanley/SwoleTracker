
class ExerciseEntriesController < ApplicationController

  before_filter :require_user

  # GET /exercise_entries
  # GET /exercise_entries.json
  def index
    @exercise_entries = ExerciseEntry.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @exercise_entries }
    end
  end

  # GET /exercise_entries/1
  # GET /exercise_entries/1.json
  def show
    @exercise_entry = ExerciseEntry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @exercise_entry }
    end
  end

  # GET /exercise_entries/new
  # GET /exercise_entries/new.json
  def new
    @exercise_entry = ExerciseEntry.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @exercise_entry }
    end
  end

  # GET /exercise_entries/1/edit
  def edit
    @exercise_entry = ExerciseEntry.find(params[:id])
  end

  # POST /exercise_entries
  # POST /exercise_entries.json
  def create
    @exercise_entry = ExerciseEntry.new(params[:exercise_entry])

    respond_to do |format|
      if @exercise_entry.save
        format.html { redirect_to @exercise_entry, notice: 'Exercise entry was successfully created.' }
        format.json { render json: @exercise_entry, status: :created, location: @exercise_entry }
      else
        format.html { render action: "new" }
        format.json { render json: @exercise_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /exercise_entries/1
  # PUT /exercise_entries/1.json
  def update
    @exercise_entry = ExerciseEntry.find(params[:id])

    respond_to do |format|
      if @exercise_entry.update_attributes(params[:exercise_entry])
        format.html { redirect_to @exercise_entry, notice: 'Exercise entry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @exercise_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exercise_entries/1
  # DELETE /exercise_entries/1.json
  def destroy
    @exercise_entry = ExerciseEntry.find(params[:id])
    @exercise_entry.destroy

    respond_to do |format|
      format.html { redirect_to exercise_entries_url }
      format.json { head :no_content }
    end
  end
end
