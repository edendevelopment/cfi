class Relationship < ActiveRecord::Base
  belongs_to :from, :class_name => "Person"
  belongs_to :to, :class_name => "Person"
  
  validates_presence_of :from
  validates_presence_of :to
  validates_presence_of :relationship_type
  
  validate :ensure_people_are_different
  validate :ensure_unique_relationship
  
  def other_half(person)
    from == person ? to : from
  end
  
  def self.including_people(person1, person2, type)
    return nil if person1.nil? || person2.nil?
    find(:first, :conditions => ["((from_id = :person1_id AND to_id = :person2_id) OR (from_id = :person2_id AND to_id = :person1_id)) AND relationship_type = :type", {:person1_id => person1.id, :person2_id => person2.id, :type => type}])
  end
  
  private
  def ensure_people_are_different
    errors.add_to_base "You can't join a person to themselves" if from == to
  end
  
  def ensure_unique_relationship
    ensure_unique_caretaker if caretaker?
    errors.add_to_base "These two people already have that relationship" if Relationship.including_people(from, to, relationship_type)
  end
  
  def ensure_unique_caretaker
    errors.add_to_base "This person is already a caretaker" if Relationship.find(:first, :conditions => {:from_id => from.id, :to_id => to.id, :caretaker => true})
  end
end