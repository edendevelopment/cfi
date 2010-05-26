class CreateRelationships < ActiveRecord::Migration
  def self.up
    create_table :relationships do |t|
      t.integer :from_id
      t.integer :to_id
      t.string :type
      t.timestamps
    end
  end

  def self.down
    drop_table :relationships
  end
end
