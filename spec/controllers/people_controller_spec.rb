require 'spec_helper'

describe PeopleController do
  before(:each) do
    @person = mock_model(Person)
    Person.stub_find!(@person)
  end

  describe "creating new person" do
    before(:each) do
      log_in
      Person.stub!(:new).and_return(@person)
      @person.stub!(:save).and_return(false)
    end
    
    def do_request
      post :create, :person => {}
    end
    
    context "on failure" do
      it "redirects to the people index page" do
        do_request
        response.should redirect_to(people_path)
      end
      
      it "displays a flash error" do
        do_request
        flash[:error].should_not be_nil
      end
    end
  end
  
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
  
  describe "making person a student" do
    before(:each) do
      log_in
      @person = mock_model(Person, :make_student! => true)
      Person.stub_find!(@person)
    end
    
    def do_request
      post :make_student, :id => @person.id
    end
    
    it "makes the person a student" do
      @person.should_receive(:make_student!)
      do_request
    end
    
    it "redirects to the person page" do
      do_request
      response.should redirect_to(person_path(@person))
    end
  end
  
  describe "adding a sibling" do
    before(:each) do
      log_in
      @person = mock_model(Person)
      @person.stub!(:add_sibling)
      @sibling = mock_model(Person)
      Person.stub_find!(@person)
      Person.stub_find!(@sibling)
    end
    
    def do_post
      post :add_sibling, :id => @person.id,  :person_id => @sibling.id
    end
    
    it "adds the sibling" do
      @person.should_receive(:add_sibling).with(@sibling)
      do_post
    end
    
    it "redirects to the person page" do
      do_post
      response.should redirect_to(person_path(@person))
    end
  end
end
