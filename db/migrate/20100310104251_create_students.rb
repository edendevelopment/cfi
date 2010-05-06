class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students do |t|
      t.string :name
      t.date :date_of_birth
      t.string :village
      t.string :gender
      t.text :siblings
      t.text :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :students
  end
end
