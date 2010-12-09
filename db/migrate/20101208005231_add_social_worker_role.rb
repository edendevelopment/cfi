class AddSocialWorkerRole < ActiveRecord::Migration
  def self.up
    add_column :users, :social_worker, :boolean, :default => false
  end

  def self.down
    remove_column :users, :social_worker
  end
end
