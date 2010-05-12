class Student < ActiveRecord::Base
  has_many :photos
  belongs_to :village
  
  image_accessor :image
  
  delegate :name, :to => :village, :prefix => true

  def name_and_village
    "#{name} (Village: #{village_name})"
  end
end
