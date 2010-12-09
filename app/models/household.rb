class Household < ActiveRecord::Base
  validates_presence_of :caretaker
  
  default_scope :order => "caretaker asc"
  
  has_many :people
  
  acts_as_commentable

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
  
  def add_note(note_text, user)
    comments.create!(:comment => note_text, :user => user)
  end

  def update_note(note, new_note_text, user)
    note = comments.find(note.id)
    note.comment = new_note_text
    note.user_id = user.id
    note.updated_at = DateTime.now
    note.save
  end  
end
