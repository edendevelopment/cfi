require File.dirname(__FILE__) + '/../spec_helper'

describe Relationship do
  describe "other_half(person)" do
    it "returns the other half of the relationship" do
      to = mock_model(Person)
      from = mock_model(Person)
      relationship = Relationship.new(:to => to, :from => from)
      relationship.other_half(to).should == from
      relationship.other_half(from).should == to
    end
  end
  
  describe ".including_people" do
    before(:each) do
      @from = Factory.create :person
      @to = Factory.create :person
      @relationship = Relationship.create! :from => @from, :to => @to, :relationship_type => "sibling"
    end
    
    context "with the right people and type" do
      it "returns the relationship" do
        Relationship.including_people(@from, @to, "sibling").should == @relationship
        Relationship.including_people(@to, @from, "sibling").should == @relationship
      end
    end
    
    context "with the wrong type" do
      it "returns nil" do
        Relationship.including_people(@from, @to, "parent").should be_nil
      end
    end
    
    context "with the wrong person" do
      it "returns nil" do
        Relationship.including_people(@from, Factory.create(:person), "sibling").should be_nil
      end
    end
  end
  
  describe "validating a relationship between person1 and person2" do
    before(:each) do
      @person1 = Factory.create :person
      @person2 = Factory.create :person
    end
    
    it "requires a 'from' person" do
      relationship = Relationship.new
      relationship.should_not be_valid
      relationship.errors.on(:from).should_not be_nil
    end
    
    it "requires a 'to' person" do
      relationship = Relationship.new
      relationship.should_not be_valid
      relationship.errors.on(:to).should_not be_nil
    end
    
    it "requires a relationship_type" do
      relationship = Relationship.new
      relationship.should_not be_valid
      relationship.errors.on(:relationship_type).should_not be_nil
    end
    
    it "doesn't allow adding a relationship from person 1 to person1" do
      relationship = Relationship.new(:from => @person1, :to => @person1, :relationship_type => "sibling")
      relationship.should_not be_valid
      relationship.errors.full_messages.join("\n").should include("You can't join a person to themselves")
    end
    
    it "doesn't allow a user to be related to the same user twice with the same type" do
      Relationship.create!(:from => @person1, :to => @person2, :relationship_type => "parent")
      
      relationship = Relationship.new(:from => @person1, :to => @person2, :relationship_type => "parent")
      relationship.should_not be_valid
      relationship.errors.full_messages.join("\n").should include("These two people already have that relationship")
      
      
      relationship = Relationship.new(:from => @person2, :to => @person1, :relationship_type => "parent")
      relationship.should_not be_valid
      relationship.errors.full_messages.join("\n").should include("These two people already have that relationship")
    end
    
    it "allows a user to be related to the same user with different relationship_types" do
      Relationship.create!(:from => @person1, :to => @person2, :relationship_type => "parent")
      
      relationship = Relationship.new(:from => @person1, :to => @person2, :relationship_type => "caretaker")
      relationship.should be_valid
    end
  end
end
