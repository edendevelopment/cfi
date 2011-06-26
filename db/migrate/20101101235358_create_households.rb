class CreateHouseholds < ActiveRecord::Migration
  def self.up
    create_table :households do |t|
      t.string :caretaker
      t.string :description
      t.string :contact_information
      t.string :address

      t.timestamps
    end
  end

  def self.down
    drop_table :households
  end
end
