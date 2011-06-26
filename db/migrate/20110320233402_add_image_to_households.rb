class AddImageToHouseholds < ActiveRecord::Migration
  def self.up
    add_column :households, :image_uid, :string
  end

  def self.down
    remove_column :households, :image_uid
  end
end
