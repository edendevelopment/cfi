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
      @person.add_sibling(@sibling)
      @person.reload.siblings.should == [@sibling]
      @sibling.reload.siblings.should == [@person]
    end
  end
end
