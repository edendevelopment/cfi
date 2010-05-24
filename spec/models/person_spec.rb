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
end
