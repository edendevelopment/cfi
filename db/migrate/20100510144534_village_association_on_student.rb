class VillageAssociationOnStudent < ActiveRecord::Migration
  def self.up
    add_column :students, :village_id, :integer
    remove_column :students, :village
  end

  def self.down
    add_column :students, :village, :string
    remove_column :students, :village_id
  end
end
