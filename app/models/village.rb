class Village < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  
  default_scope :order => "name asc"
  
  has_many :addresses
  has_many :people, :through => :addresses
end