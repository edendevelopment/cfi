require 'spec_helper'

describe Person do

  describe 'name and village' do
    before do
      @person = Person.new(:name => 'Bob')
    end

    it 'includes the village when there is one' do
      @person.stub!(:village_name => 'a village')
      @person.name_and_village.should == 'Bob (Village: a village)'
    end

    it "doesn't show the village when there isn't one" do
      @person.stub!(:village_name => '')
      @person.name_and_village.should == 'Bob'
    end
  end
  
  describe "comments" do
    before do
      @person = Factory.create :person
      @user = Factory.create :user
    end
    
    context "adding a comment" do
      it "adds the comment by the user" do
        @person.add_comment("Foo", @user)
        comment = @person.reload.comments.first
        comment.comment.should == "Foo"
        comment.user.should == @user
      end
    end
    
    context "modifying a comment" do
      it "updates the comment" do
        @person.add_comment("Foo Bar", @user)
        comment = @person.reload.comments.first
        @person.update_comment(comment, "raB ooF", @user)
        @person.reload.comments.first.comment.should == "raB ooF"
      end
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
  
  describe "adding a caretaker" do
    before(:each) do
      @person = Factory.create :person
      @caretaker = Factory.create :person
    end
    
    it "adds the caretaker to the person" do
      @person.add_caretaker(@caretaker)
      @person.reload.caretakers.should == [@caretaker]
    end
    
    context "caretakers" do
      it "returning a list of the persons caretakers" do
        relationship = mock_model(Relationship, :from => @caretaker)
        Relationship.should_receive(:find).with(:all, hash_including({:conditions => {:to_id => @person.id, :relationship_type => Relationship::CARETAKER }})).and_return([relationship])
        @person.caretakers.should == [@caretaker]
      end
    end
  end
  
  describe "#relationship_with(person)" do
    before(:each) do
      @person = Factory.create :person
      @caretaker = Factory.create :person
    end
    
    context "with more than one relationship" do
      it "returns a comma-separated list of relationships" do
        relationship1 = mock_model(Relationship, :relationship_to => Relationship::CARETAKER)
        relationship2 = mock_model(Relationship, :relationship_to => "aunt")
        Relationship.stub!(:find => [relationship1, relationship2])
        @person.relationship_with(@caretaker).should == "#{Relationship::CARETAKER}, aunt"
      end
    end
    
    context "with one relationship" do
      it "returns the relationship" do
        relationship1 = mock_model(Relationship, :relationship_to => Relationship::CARETAKER)
        Relationship.stub!(:find => [relationship1])
        @person.relationship_with(@caretaker).should == "#{Relationship::CARETAKER}"
      end
    end
    
    context "with no relationships" do
      it "returns a blank string" do
        Relationship.stub!(:find => [])
        @person.relationship_with(@caretaker).should == ''
      end
    end
  end
  
  describe "#remove_caretaker" do
    before(:each) do
      @person = Factory.create :person
      @caretaker = Factory.create :person
    end
    
    it "removes the caretaker from the person" do
      @person.add_caretaker(@caretaker)
      @person.remove_caretaker(@caretaker)
      @person.reload.caretakers.should == []
    end
    
    it "removes all instance of the caretaker from the person" do
      @person.add_caretaker(@caretaker)
      @person.add_caretaker(@caretaker)
      @person.remove_caretaker(@caretaker)
      @person.reload.caretakers.should == []
    end
  end
  
  describe "date_of_birth_with_confirmation" do
    before(:each) do
      @person = Factory.build :person, :date_of_birth => Date.parse("1999-11-23")
    end
    
    context "confirmed" do
      before(:each) do
        @person.date_of_birth_confirmed = true
      end
      it "returns the confirmed date of birth " do
        @person.date_of_birth_with_confirmation.should == "1999-11-23 (Confirmed)"
      end
    end
    
    context "unconfirmed" do
      before(:each) do
        @person.date_of_birth_confirmed = false
      end
      it "returns the confirmed date of birth " do
        @person.date_of_birth_with_confirmation.should == "1999-11-23 (Unconfirmed)"
      end
    end
  end

  def mock_person_called(name)
    mock(:person, :name => name)
  end

  describe "searching people" do
    it "searches by name" do
      Person.should_receive(:find).with(:all, :conditions => ['name LIKE ?', '%Spencer%'])
      Person.search('Spencer')
    end

    it "returns what it finds" do
      results = mock(:people)
      Person.stub!(:find => results)
      Person.search('Enrique').should == results
    end
  end
end
