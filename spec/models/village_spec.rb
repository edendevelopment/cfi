require File.dirname(__FILE__) + '/../spec_helper'

describe Village do
  describe "validations" do
    before(:each) do
      @village = Factory.build(:village)
    end
    
    it "must have a name" do
      @village.name = nil
      @village.should_not be_valid
      @village.errors_on(:name).should_not be_nil
    end
    
    it "must not have a duplicate name" do
      created_village = Factory.create(:village)
      @village.name = created_village.name
      @village.should_not be_valid
      @village.errors_on(:name).should_not be_nil
    end
  end
end
