require 'spec_helper'

describe StudentsController do
  describe "#add_comment" do
    before(:each) do
      log_in
      @student = mock_model(Student, :add_comment => true)
      Student.stub_find!(@student)
    end

    context "with a valid comment" do
      def do_request
        post :add_comment, :id => @student.id, :comment => "This is a comment about a student"
      end

      it "adds the comment to the student" do
        @student.should_receive(:add_comment).with("This is a comment about a student", @current_user)
        do_request
      end

      it "redirects to the student show page" do
        do_request
        response.should redirect_to(student_path(@student))
      end
    end

    context "with a blank comment" do
      def do_request
        post :add_comment, :id => @student.id, :comment => ""
      end

      it "doesn't add the comment to the student" do
        @student.should_not_receive(:add_comment)
        do_request
      end

      it "redirects to the student show page" do
        do_request
        response.should redirect_to(student_path(@student))
      end
    end

  end
end
