class MoveNotesToCommentsInStudents < ActiveRecord::Migration
  class Comment < ActiveRecord::Base

  end
  class Student < ActiveRecord::Base

  end
  def self.up
    user = User.first
    if user
      Student.all.each do |student|
        next if student.notes.blank?
        Comment.create!(:commentable_id => student.id, :commentable_type => "Student", :comment => student.notes, :user_id => user.id)
      end
    end
    remove_column :students, :notes
  end

  def self.down
    add_column :students, :notes, :text
    Student.all.each do |student|
      comments = Comment.find(:all, :conditions => {:commentable_type => "Student", :commentable_id => student.id}, :order => "created_at asc")
      student.update_attributes :notes => comments.map(&:comment).join("\n\n")
      comments.each(&:destroy)
    end
  end
end
