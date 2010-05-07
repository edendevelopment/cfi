class StudentsController < ApplicationController
  def show
    @student = Student.find(params[:id])
  end

  def create
    student = Student.create(params[:student])
    redirect_to student_path(student)
  end 
  
  def edit
    @student = Student.find(params[:id])
  end
  
  def new
    @student = Student.new
  end
  
  def update
    @student = Student.find(params[:id])
    if @student.update_attributes(params[:student])
      redirect_to @student
    else
      flash[:error] = 'There were errors updating the student'
      render :edit
    end
  end
end
