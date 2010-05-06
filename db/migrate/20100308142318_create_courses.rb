class CreateCourses < ActiveRecord::Migration
  def self.up
    create_table :courses do |t|
      t.string :name
      t.string :time
      t.string :schedule
      t.string :teacher

      t.timestamps
    end
  end

  def self.down
    drop_table :courses
  end
end
