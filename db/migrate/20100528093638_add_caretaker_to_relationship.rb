class AddCaretakerToRelationship < ActiveRecord::Migration
  def self.up
    add_column :relationships, :caretaker, :boolean, :default => false
  end

  def self.down
    remove_column :relationships, :caretaker
  end
end
