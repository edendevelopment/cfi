class Household < ActiveRecord::Base
  validates_presence_of :caretaker
  
  default_scope :order => "caretaker asc"
  
  has_many :people
  
  acts_as_commentable

  image_accessor :image

  def eligible_people
    Person.find_with_no_household
  end

  def add_person(person)
    people << person unless people.include?(person)
  end
  
  def remove_person(person)
    people.delete(person)
  end

  def recent_notes
    comments.order("created_at desc")
  end
end
