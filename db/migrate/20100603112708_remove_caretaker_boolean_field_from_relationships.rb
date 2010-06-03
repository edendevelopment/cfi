class RemoveCaretakerBooleanFieldFromRelationships < ActiveRecord::Migration
  def self.up
    remove_column :relationships, :caretaker
  end

  def self.down
    add_column :relationships, :caretaker, :boolean, :default => false, :null => false
  end
end
