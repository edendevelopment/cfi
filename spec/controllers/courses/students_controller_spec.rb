require File.dirname(__FILE__) + '/../../spec_helper'

describe Courses::StudentsController do
  before(:each) do
    @course = mock_model(Course, :add_student => true, :remove_student => true)
    Course.stub_find!(@course)
  end
  
  describe "#create" do
    before(:each) do
      @student = mock_model(Student)
      Student.stub_find!(@student)
    end
    
    def do_request
      post :create, :course_id => @course.id, :student_id => @student.id
    end
    
    it "should add the student to the course" do
      @course.should_receive(:add_student).with(@student)
      do_request
    end
    
    it "redirects to the course page" do
      do_request
      response.should redirect_to(course_path(@course))
    end
  end
  
  describe "#destroy" do
    before(:each) do
      @student = mock_model(Student)
      Student.stub_find!(@student)
    end
  
    def do_request
      delete :destroy, :course_id => @course.id, :id => @student.id
    end
  
    it "should add the student to the course" do
      @course.should_receive(:remove_student).with(@student)
      do_request
    end
  
    it "redirects to the course page" do
      do_request
      response.should redirect_to(course_path(@course))
    end
  end
end
