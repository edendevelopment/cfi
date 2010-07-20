require File.dirname(__FILE__) + '/../../spec_helper'

describe Courses::StudentsController do
  before(:each) do
    log_in
    @course = mock_model(Course, :add_student => true, :remove_student => true)
    Course.stub_find!(@course)
  end
  
  describe "#create" do
    before(:each) do
      @student = mock_model(Student)
      Student.stub_find!(@student)
    end
    
    context "via html" do
      def do_request
        post :create, :course_id => @course.id, :student_id => @student.id
      end

      it "adds the student to the course" do
        @course.should_receive(:add_student).with(@student)
        do_request
      end
    
      it "redirects to the course page" do
        do_request
        response.should redirect_to(course_path(@course))
      end
    end
    
    context "via ajax" do
      def do_request
        xhr :post, :create, :course_id => @course.id, :student_id => @student.id
      end
      
      it "adds the student to the course" do
        @course.should_receive(:add_student).with(@student)
        do_request
      end
    
      it "sends the student list partial to the page" do
        do_request
        response.should render_template('courses/_student')
      end
    end
  end
  
  describe "#destroy" do
    before(:each) do
      @student = mock_model(Student)
      Student.stub_find!(@student)
    end
    
    context "via html" do
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
    
    context "via js" do
      def do_request
        xhr :delete, :destroy, :course_id => @course.id, :id => @student.id
      end
  
      it "should add the student to the course" do
        @course.should_receive(:remove_student).with(@student)
        do_request
      end
  
      it "sends the student list partial to the page" do
        do_request
        response.should be_success
      end
    end
  end
end
