require 'spec_helper'

describe PeopleController do
  before(:each) do
    @person = mock_model(Person)
  end

  describe "paginated view of people" do
    before do
      log_in
    end

    it "looks for people alphabetically" do
      people = mock(:people_array)
      Person.should_not_receive(:all)
      Person.should_receive(:alphabetical_group).and_return(people)
      get :index
      assigns[:people].should == people
    end

    it "looks for people with the letter specified" do
      Person.should_receive(:alphabetical_group).with('Z')
      get :index, :letter => "Z"
    end
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
      response.should redirect_to(siblings_person_path(@person))
    end
  end
  
  describe "adding a sibling" do
    before(:each) do
      log_in
      @person = mock_model(Person, :remove_sibling => true)
      @sibling = mock_model(Person)
      Person.stub_find!(@person)
      Person.stub_find!(@sibling)
    end
    
    def do_delete
      delete :remove_sibling, :id => @person.id,  :sibling_id => @sibling.id
    end
    
    it "adds the sibling" do
      @person.should_receive(:remove_sibling).with(@sibling)
      do_delete
    end
    
    it "redirects to the person page" do
      do_delete
      response.should redirect_to(siblings_person_path(@person))
    end
  end
  
  describe "caretakers" do
    before(:each) do
      log_in
      @person = mock_model(Person)
      Person.stub_find!(@person)
    end
    
    it "should find the person" do
      get :caretakers, :id => @person.id
      assigns[:person].should == @person
    end
    
    context "adding a caretaker" do
      before(:each) do
        @person.stub!(:add_caretaker)
        @caretaker = mock_model(Person)
        Person.stub_find!(@caretaker)
      end
      
      def do_request
        post :add_caretaker, :id => @person.id, :person_id => @caretaker.id
      end
      
      it "adds the caretaker to the person" do
        @person.should_receive(:add_caretaker).with(@caretaker)
        do_request
      end
      
      it "redirects back to the person page" do
        do_request
        response.should redirect_to(caretakers_person_path(@person))
      end
    end
    
    context "remove a caretaker" do
      before(:each) do
        log_in
        @person.stub!(:remove_caretaker)
        @caretaker = mock_model(Person)
        Person.stub_find!(@caretaker)
      end
      
      def do_delete
        delete :remove_caretaker, :id => @person.id, :caretaker_id => @caretaker.id
      end
      
      it 'removes the caretaker' do
        @person.should_receive(:remove_caretaker).with(@caretaker)
        do_delete
      end
      
      it "redirects to the persons caretaker page" do
        do_delete
        response.should redirect_to(caretakers_person_path(@person))
      end
    end
  end
end
