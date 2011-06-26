class Person < ActiveRecord::Base
  paginate_alphabetically :by => :name

  acts_as_commentable
  has_many :photos
  has_one :student
  
  has_one :address
  accepts_nested_attributes_for :address
  
  has_one :public_education_info
  accepts_nested_attributes_for :public_education_info
  
  has_one :obligations
  accepts_nested_attributes_for :obligations
  
  has_one :social_development_info
  accepts_nested_attributes_for :social_development_info

  image_accessor :image

  belongs_to :household

  delegate :name, :to => :village, :prefix => true, :allow_nil => true
  delegate :caretaker, :to => :household, :prefix => true, :allow_nil => true
  
  delegate :house_number, :group_number, :village, :to => :address, :allow_nil => true
  
  validates_presence_of :name
  validates_presence_of :gender

  def name_and_village
    village = village_name
    String.new.tap do |str|
      str << name
      str << " (Village: #{village})" unless village.blank?
    end
  end

  def name_and_caretaker
    household = household_caretaker
    String.new.tap do |str|
      str << name
      str << " (Household: #{household})" unless household.blank?
    end
  end

  def date_of_birth_with_confirmation
    "#{date_of_birth} (#{ date_of_birth_confirmed  ? 'Confirmed' : 'Unconfirmed' })"
  end

  def add_comment(comment_text, user)
    comments.create!(:comment => comment_text, :user => user)
  end

  def recent_comments
    comments.order("created_at desc")
  end
  
  def update_comment(comment, new_comment_text, user)
    comment = comments.find(comment.id)
    comment.comment = new_comment_text
    comment.user_id = user.id
    comment.updated_at = DateTime.now
    comment.save
  end
  
  def make_student!
    Student.create!(:person_id => self.id) unless student
  end
  
  def add_sibling(sibling)
    add_relationship(sibling, Relationship::SIBLING)
  end
  
  def siblings
    Relationship.including_people([self], Relationship::SIBLING).map do |relationship|
      relationship.other_half(self)
    end
  end
  
  def remove_sibling(sibling)
    Relationship.including_people([self, sibling], Relationship::SIBLING).map(&:destroy)
  end
  
  def add_caretaker(caretaker)
    add_relationship(caretaker, Relationship::CARETAKER)
  end
  
  def caretakers
    Relationship.where(:to_id => self.id, :relationship_type => Relationship::CARETAKER).map(&:from)
  end
  
  def remove_caretaker(caretaker)
    Relationship.where(:from_id => caretaker.id, :to_id => self.id, :relationship_type => Relationship::CARETAKER).each(&:destroy)
  end
  
  def relationship_with(person)
    Relationship.including_people([self, person]).map do |relationship|
      relationship.relationship_to(self)
    end.join(", ")
  end

  def self.search(name)
    Person.where('name LIKE ?', "%#{name}%")
  end
  
  def self.find_with_no_household
    Person.where(:household_id => nil)
  end

  private
  def add_relationship(person, relationship_type)
    Relationship.create(:from_id => person.id, :to_id => self.id, :relationship_type => relationship_type)
  end
end
