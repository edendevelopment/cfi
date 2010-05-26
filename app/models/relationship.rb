class Relationship < ActiveRecord::Base
  belongs_to :from, :class_name => "Person"
  belongs_to :to, :class_name => "Person"
  
  def other_half(person)
    from == person ? to : from
  end
  
  def self.including_people(person1, person2, type)
    find(:first, :conditions => ["((from_id = :person1_id AND to_id = :person2_id) OR (from_id = :person2_id AND to_id = :person1_id)) AND relationship_type = :type", {:person1_id => person1.id, :person2_id => person2.id, :type => type}])
  end
end