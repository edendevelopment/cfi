class Student < ActiveRecord::Base
  has_many :photos
  
  image_accessor :image
end
