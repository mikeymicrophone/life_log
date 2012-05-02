class SleepsController < ApplicationController
  # GET /sleeps
  # GET /sleeps.json
  def index
    debugger
    @sleeps = if params[:note]
      Sleep.with_note
    elsif params[:order] == 'ascending'
      Sleep.chronological
    elsif params[:order] == 'descending'
      Sleep.antichronological
    else
      Sleep.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sleeps }
    end
  end

  # GET /sleeps/1
  # GET /sleeps/1.json
  def show
    @sleep = Sleep.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sleep }
    end
  end

  # GET /sleeps/new
  # GET /sleeps/new.json
  def new
    @sleep = Sleep.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sleep }
    end
  end

  # GET /sleeps/1/edit
  def edit
    @sleep = Sleep.find(params[:id])
  end

  # POST /sleeps
  # POST /sleeps.json
  def create
    @sleep = Sleep.new(params[:sleep])

    respond_to do |format|
      if @sleep.save
        format.html { redirect_to @sleep, notice: 'Sleep was successfully created.' }
        format.json { render json: @sleep, status: :created, location: @sleep }
      else
        format.html { render action: "new" }
        format.json { render json: @sleep.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sleeps/1
  # PUT /sleeps/1.json
  def update
    @sleep = Sleep.find(params[:id])

    respond_to do |format|
      if @sleep.update_attributes(params[:sleep])
        format.html { redirect_to @sleep, notice: 'Sleep was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sleep.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sleeps/1
  # DELETE /sleeps/1.json
  def destroy
    @sleep = Sleep.find(params[:id])
    @sleep.destroy

    respond_to do |format|
      format.html { redirect_to sleeps_url }
      format.json { head :no_content }
    end
  end
end
