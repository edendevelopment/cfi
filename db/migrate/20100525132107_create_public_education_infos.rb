class CreatePublicEducationInfos < ActiveRecord::Migration
  def self.up
    create_table :public_education_infos do |t|
      t.references :person
      t.boolean :attending, :default => false
      t.string :grade
      t.text :performance
      t.text :attendance_patterns
      t.text :past_attendance
      t.text :name_of_schools
      t.text :school_contact
    end
  end

  def self.down
    drop_table :public_education_infos
  end
end
