class ExercisesController < ApplicationController
  def show
    @exercise = Exercise.find params[:id]
  end
  
  def new
    @exercise = Exercise.new
  end
  
  def create
    @exercise = Exercise.new(params[:exercise])
    # @exercise.name = params[:exercise][:name]
    
    @exercise.save
    redirect_to @exercise
  end
  
  def edit
    @exercise = Exercise.find params[:id]
  end
  
  def update
    @exercise = Exercise.find params[:id]
    
    @exercise.update_attributes params[:exercise]
    
    redirect_to @exercise, :notice => "The update was very successful.  Please come again."
  end
end
