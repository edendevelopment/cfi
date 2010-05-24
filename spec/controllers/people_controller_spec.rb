require 'spec_helper'

describe PeopleController do
  describe "#add_comment" do
    before(:each) do
      log_in
      @person = mock_model(Person, :add_comment => true)
      Person.stub_find!(@person)
    end

    context "with a valid comment" do
      def do_request
        post :add_comment, :id => @person.id, :comment => "This is a comment about a person"
      end

      it "adds the comment to the person" do
        @person.should_receive(:add_comment).with("This is a comment about a person", @current_user)
        do_request
      end

      it "redirects to the person show page" do
        do_request
        response.should redirect_to(person_path(@person))
      end
    end

    context "with a blank comment" do
      def do_request
        post :add_comment, :id => @person.id, :comment => ""
      end

      it "doesn't add the comment to the person" do
        @person.should_not_receive(:add_comment)
        do_request
      end

      it "redirects to the person show page" do
        do_request
        response.should redirect_to(person_path(@person))
      end
    end

  end
end
