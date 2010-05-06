class StudentsController < ApplicationController
  def show
    @student = Student.find(params[:id])
  end

  def create
    student = Student.create(params[:student])
    redirect_to student_path(student)
  end 
end
