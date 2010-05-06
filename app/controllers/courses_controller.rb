class CoursesController < ApplicationController
  def show
    @course = Course.find(params[:id])
  end
  
  def create
    Course.create(params[:course])
    redirect_to courses_path
  end 
end
