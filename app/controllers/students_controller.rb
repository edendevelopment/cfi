class StudentsController < ApplicationController
  resource_controller

  def add_comment
    student = Student.find(params[:id])
    student.add_comment(params[:comment], current_user)
    redirect_to student_path(student)
  end
end

