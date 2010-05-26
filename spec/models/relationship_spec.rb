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
end
