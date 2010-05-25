class CreatePublicEducationInfos < ActiveRecord::Migration
  def self.up
    create_table :public_education_infos do |t|
      t.references :person
      t.boolean :attending, :default => false
      t.string :grade, :default => ""
      t.text :performance, :default => ""
      t.text :attendance_patterns, :default => ""
      t.text :past_attendance, :default => ""
      t.text :name_of_schools, :default => ""
      t.text :school_contact, :default => ""
    end
  end

  def self.down
    drop_table :public_education_infos
  end
end
