class AddImageToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :image_uid, :string
  end

  def self.down
    remove_column :comments, :image_uid
  end
end
