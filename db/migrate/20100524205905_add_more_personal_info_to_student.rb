class AddMorePersonalInfoToStudent < ActiveRecord::Migration
  def self.up
    add_column :students, :house_number, :string, :default => ""
    add_column :students, :group_number, :string, :default => ""
    add_column :students, :religion, :string, :default => ""
  end

  def self.down
    remove_column :students, :house_number
    remove_column :students, :group_number
    remove_column :students, :religion
  end
end
