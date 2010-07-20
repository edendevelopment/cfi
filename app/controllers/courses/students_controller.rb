class Courses::StudentsController < ApplicationController
  before_filter :find_course
  before_filter :find_student
  
  def create
    @course.add_student(@student)
    respond_to do |wants|
      wants.html { redirect_to course_path(@course) }
      wants.js { render :partial => 'courses/student', :object => @student, :locals => { :course => @course } }
    end
  end
  
  def destroy
    @course.remove_student(@student)
    respond_to do |wants|
      wants.html { redirect_to course_path(@course) }
      wants.js { render :nothing => true, :status => 200 }
    end
  end

private  
  def find_course
    @course = Course.find(params[:course_id])
  end
  
  def find_student
    @student = Student.find(params[:student_id] || params[:id])
  end
end