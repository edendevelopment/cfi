class Courses::StudentsController < ApplicationController
  before_filter :find_course
  before_filter :find_student
  
  def create
    @course.add_student(@student)
    respond_with_students_partial
  end
  
  def destroy
    @course.remove_student(@student)
    respond_with_students_partial
  end

private  
  def respond_with_students_partial
    respond_to do |wants|
      wants.html { redirect_to course_path(@course) }
      wants.js { render :partial => 'courses/students', :locals => { :course => @course } }
    end
  end

  def find_course
    @course = Course.find(params[:course_id])
  end
  
  def find_student
    @student = Student.find(params[:student_id] || params[:id])
  end
end