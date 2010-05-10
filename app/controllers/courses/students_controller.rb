class Courses::StudentsController < ApplicationController
  resource_controller
  before_filter :find_course
  before_filter :find_student
  
  def create
    @course.add_student(@student)
    redirect_to course_path(@course)
  end
  
  def destroy
    @course.remove_student(@student)
    redirect_to course_path(@course)
  end
  
  def find_course
    @course = Course.find(params[:course_id])
  end
  
  def find_student
    @student = Student.find(params[:student_id] || params[:id])
  end
end