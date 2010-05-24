class Student < ActiveRecord::Base
  belongs_to :person
  
  delegate :name, :village, :name_and_village, :to => :person, :allow_nil => true
end