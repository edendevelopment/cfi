class RenameStudentsToPeople < ActiveRecord::Migration
  def self.up
    rename_table :students, :people
  end

  def self.down
    rename_table :people, :students
  end
end
