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
    PARENT => { :from => { :male => "father", :female => "mother" },
                :to => { :male => "son", :female => "daughter" }
              },
    SIBLING => { :from => { :male => "brother", :female => "sister" },
                 :to => { :male => "brother", :female => "sister" }
               },
    CARETAKER => { :from => { :male => "caretaker", :female => "caretaker" }, 
                   :to => { :male => "dependent", :female => "dependent" }
                 }
  }
  
  def other_half(person)
    from == person ? to : from
  end
  
  def self.including_people(people, type = nil)
    people = people.compact
    return [] if people.empty?
    conditions = []
    substitions = []
    people.each do |person|
      conditions << "(from_id = ? OR to_id = ?)"
      substitions += [person.id, person.id]
    end
    unless type.nil?
      conditions << "relationship_type = ?"
      substitions << type
    end
    
    find(:all, :conditions => [conditions.join(" AND ")] + substitions)
  end
  
  def relationship_to(person)
    gender = other_half(person).gender.downcase.to_sym
    if person == to
      RELATIONSHIP_LINKS[relationship_type][:from][gender]
    else
      RELATIONSHIP_LINKS[relationship_type][:to][gender]
    end
  end
  
  private
  def ensure_people_are_different
    errors.add :base, "You can't join a person to themselves" if from == to
  end
  
  def ensure_unique_relationship
    errors.add :base, "These two people already have that relationship" unless Relationship.including_people([from, to], relationship_type).empty?
  end
end