require File.dirname(__FILE__) + '/../spec_helper'

describe VillagesController do
  describe "create" do
    before(:each) do
      log_in
      @village = mock_model(Village, :name => "Foo")
      Village.stub!(:new).and_return(@village)
    end
    
    def do_request
      post :create, :village => {}
    end
    
    context "on success" do
      before(:each) do
        @village.stub!(:save => true)
      end
      
      it "redirects to the index page" do
        do_request
        response.should redirect_to(villages_path)
      end
      
      it "displays a flash message" do
        do_request
        flash[:notice].should_not be_blank
      end
    end
    
    context "on failure" do
      before(:each) do
        @village.stub!(:save => false)
        
        # Looks like inherited_resources 1.1.2 checks
        # errors.empty? for success / failure
        # TODO: Report as an issue?
        @village.stub!(:errors => ["Not empty"])
      end
      
      it "renders the index page" do
        do_request
        response.should render_template("villages/index")
      end
    end
  end
end
