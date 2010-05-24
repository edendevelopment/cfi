class Student < ActiveRecord::Base
  acts_as_commentable
  has_many :photos
  belongs_to :village

  image_accessor :image

  delegate :name, :to => :village, :prefix => true, :allow_nil => true

  def name_and_village
    "#{name} (Village: #{village_name})"
  end

  def add_comment(comment_text, user)
    comments.create!(:comment => comment_text, :user => user)
  end

  def recent_comments
    comments.find(:all, :order => "created_at desc")
  end
end
