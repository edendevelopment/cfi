require 'spec_helper'

describe Course do
  describe "adding a student" do
    before(:each) do
      @course = Factory.create :course
      @student = Factory.create :student
    end
    
    it "adds the student" do
      @course.add_student(@student)
      @course.reload.students.should == [@student]
    end
    
    it "only adds the student once" do
      @course.add_student(@student)
      @course.add_student(@student)
      @course.students.should == [@student]
    end
  end
  
  describe "removing a student" do
    it "removes the student" do
      @course = Factory.create :course
      @student = Factory.create :student
      @course.add_student(@student)
      @course.remove_student(@student)
      @course.reload.students.should == []
    end
  end
end
