require 'spec_helper'

describe Household do
  describe "validations" do
    it "requires a caretaker" do
      household = Household.new
      household.valid?
      household.errors[:caretaker].should_not be_nil
    end
  end
  
  describe "adding a person" do
    before(:each) do
      @household = Factory.create :household
      @person = Factory.create :person
    end
    
    it "adds the person" do
      @household.add_person(@person)
      @household.reload.people.should == [@person]
    end
    
    it "only adds the person once" do
      @household.add_person(@person)
      @household.add_person(@person)
      @household.people.should == [@person]
    end
  end
  
  describe "removing a person" do
    it "removes the person" do
      @household = Factory.create :household
      @person = Factory.create :person
      @household.add_person(@person)
      @household.remove_person(@person)
      @household.reload.people.should == []
    end
  end
  
  describe "eligible persons" do
    it "returns all people not already in a household" do
      alice = Factory.create :person
      bob = Factory.create :person
      charles = Factory.create :person
      household1 = Factory.create :household
      household2 = Factory.create :household
      household1.add_person(bob)
      household2.eligible_people.sort_by(&:name).should == [alice, charles].sort_by(&:name)
    end
  end
end
