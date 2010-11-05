class Household < ActiveRecord::Base
  validates_presence_of :caretaker
  
  default_scope :order => "caretaker asc"
  
  has_many :people
  
  def eligible_people
    Person.find_with_no_household
  end

  def add_person(person)
    people << person unless people.include?(person)
  end
  
  def remove_person(person)
    people.delete(person)
  end
end
