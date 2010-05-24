require 'spec_helper'

describe Student do
  describe "adding a comment" do
    it "adds the comment by the user" do
      student = Factory.create :student
      user = Factory.create :user
      student.add_comment("Foo", user)
      comment = student.reload.comments.first
      comment.comment.should == "Foo"
      comment.user.should == user
    end
  end
end
