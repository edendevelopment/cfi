require 'spec_helper'

describe Course do
  describe "validations" do
    it "requires a name" do
      course = Course.new
      course.valid?
      course.errors[:name].should_not be_nil
    end
  end
  
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
  
  describe "eligible students" do
    it "returns all students not already in the class" do
      alice = Factory.create :student
      bob = Factory.create :student
      charles = Factory.create :student
      course = Factory.create :course
      course.add_student(bob)
      course.eligible_students.sort_by(&:name).should == [alice, charles].sort_by(&:name)
    end
  end
end
