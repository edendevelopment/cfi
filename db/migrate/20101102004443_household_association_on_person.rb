class HouseholdAssociationOnPerson < ActiveRecord::Migration
  def self.up
    add_column :people, :household_id, :integer
  end

  def self.down
    remove_column :people, :household_id
  end
end
