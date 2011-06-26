class Student < ActiveRecord::Base
  belongs_to :person
  
  delegate :name, :village, :name_and_village, :name_and_caretaker, :to => :person, :allow_nil => true

  def self.find_with_no_household
    Student.joins(:person).where(:people => {:household_id => nil})
  end
end
