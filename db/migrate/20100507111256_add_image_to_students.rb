class AddImageToStudents < ActiveRecord::Migration
  def self.up
    add_column :students, :image_uid, :string
  end

  def self.down
    remove_column :students, :image_uid
  end
end
