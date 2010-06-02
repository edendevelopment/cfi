class AddConfirmationToDob < ActiveRecord::Migration
  def self.up
    add_column :people, :date_of_birth_confirmed, :boolean, :default => false, :null => false
  end

  def self.down
    remove_column :people, :date_of_birth_confirmed
  end
end
