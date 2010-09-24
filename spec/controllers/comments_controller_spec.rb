require File.dirname(__FILE__) + '/../spec_helper'

describe CommentsController do
  def do_request(method, action, params = {})
    request_params = {:person_id => @person.id}.merge(params)
    eval("#{method} :#{action}, request_params")
  end
    
  describe "#create" do
    before do
      log_in
      @person = mock_model(Person, :add_comment => true)
      Person.stub_find!(@person)
    end

    context "with a valid comment" do
      it "adds the comment to the person" do
        @person.should_receive(:add_comment).with("This is a comment about a person", @current_user)
        do_request(:post, :create,  {:comment => "This is a comment about a person"})
      end

      it "redirects to the person show page" do
        do_request(:post, :create, {:comment => "This is a comment about a person"})
        response.should redirect_to(person_path(@person))
      end
    end

    context "with a blank comment" do
      it "doesn't add the comment to the person" do
        @person.should_not_receive(:add_comment)
        do_request(:post, :create)
      end

      it "redirects to the person show page" do
        do_request(:post, :create)
        response.should redirect_to(person_path(@person))
      end
    end
  end
  
  describe "modifying" do
    before do
      log_in
      @comment = mock_model(Comment, :comment => 'This is a comment', :user_id => @current_user.id)
      @person = mock_model(Person, :comments => @comment)
      Person.stub_find!(@person)
    end
    
    context "#edit" do
      def do_modifying_request(method, action)
        do_request(method, action, {:comment => {:comment => 'This is an edited comment'}, :id => @comment.id})
      end
      
      context "with a valid comment" do
        it "finds the comment" do
          @person.comments.should_receive(:find).with(@comment.id)
          do_modifying_request(:get, :edit)
        end
      end
      
      context "#update" do
        before do
          @comment.stub!(:find => @comment)
          @person.comments.stub!(:find_by_commentable_id => @comment)
          @person.stub!(:update_comment)
        end
        it "finds the comment" do
          @person.comments.should_receive(:find).with(@comment.id)
          do_modifying_request(:put, :update)
        end
        
        it "updates the comment" do
          @person.should_receive(:update_comment).with(@comment, 'This is an edited comment', @current_user)
          do_modifying_request(:put, :update)
        end
        
        it "redirects to the person show page" do
          do_modifying_request(:put, :update)
          response.should redirect_to(person_path(@person))
        end
      end
    end
  end
end
