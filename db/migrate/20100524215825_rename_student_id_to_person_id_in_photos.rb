class RenameStudentIdToPersonIdInPhotos < ActiveRecord::Migration
  def self.up
    rename_column :photos, :student_id, :person_id
  end

  def self.down
    rename_column :photos, :person_id, :student_id
  end
end
