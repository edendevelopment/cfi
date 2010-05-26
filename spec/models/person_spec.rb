require 'spec_helper'

describe Person do
  describe "adding a comment" do
    it "adds the comment by the user" do
      person = Factory.create :person
      user = Factory.create :user
      person.add_comment("Foo", user)
      comment = person.reload.comments.first
      comment.comment.should == "Foo"
      comment.user.should == user
    end
  end
  
  describe "adding siblings" do
    it "adds the sibling to the person" do
      @person = Factory.create :person
      @sibling = Factory.create :person
      @other = Factory.create :person
      @person.add_sibling(@sibling)
      @person.reload.siblings.should == [@sibling]
      @sibling.reload.siblings.should == [@person]
      @other.siblings.should be_empty
    end
  end
  
  describe "removing a sibling" do
    before(:each) do
      @person = Factory.create :person
      @sibling = Factory.create :person
    end
    
    context "when the relationship is from me to them" do
      before(:each) do
        @person.add_sibling(@sibling)
      end
      
      it "removes my sibling" do
        @person.remove_sibling(@sibling)
        @person.siblings.should be_empty
      end
    end
    
    context "when the relationship is from then to me" do
      before(:each) do
        @sibling.add_sibling(@person)
      end
      
      it "removes my sibling" do
        @person.remove_sibling(@sibling)
        @person.siblings.should be_empty
      end
    end
  end
end
