class Relationship < ActiveRecord::Base
  belongs_to :from, :class_name => "Person"
  belongs_to :to, :class_name => "Person"
  
  validates_presence_of :from
  validates_presence_of :to
  validates_presence_of :relationship_type
  
  validate :ensure_people_are_different
  validate :ensure_unique_relationship
  
  PARENT = 'parent'
  SIBLING = 'sibling'
  CARETAKER = 'caretaker'
  DEPENDENT = 'dependent'
  CHILD = 'child'
  
  RELATIONSHIP_LINKS = {
    PARENT => CHILD,
    SIBLING => SIBLING,
    CARETAKER => DEPENDENT
  }
  
  def other_half(person)
    from == person ? to : from
  end
  
  def self.including_people(person1, person2, type)
    return nil if person1.nil? || person2.nil?
    find(:first, :conditions => ["((from_id = :person1_id AND to_id = :person2_id) OR (from_id = :person2_id AND to_id = :person1_id)) AND relationship_type = :type", {:person1_id => person1.id, :person2_id => person2.id, :type => type}])
  end
  
  def relationship_to(person)
    if person == to
      relationship_type
    else
      RELATIONSHIP_LINKS[relationship_type]
    end
  end
  
  private
  def ensure_people_are_different
    errors.add_to_base "You can't join a person to themselves" if from == to
  end
  
  def ensure_unique_relationship
    errors.add_to_base "These two people already have that relationship" if Relationship.including_people(from, to, relationship_type)
  end
end