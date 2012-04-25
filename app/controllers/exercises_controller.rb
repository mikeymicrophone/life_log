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
end
