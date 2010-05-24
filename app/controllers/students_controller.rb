class StudentsController < ApplicationController
  resource_controller

  def add_comment
    student = Student.find(params[:id])
    student.add_comment(params[:comment], current_user) unless params[:comment].blank?
    redirect_to student_path(student)
  end
end

