class CreateObligations < ActiveRecord::Migration
  def self.up
    create_table :obligations do |t|
      t.references :person
      t.boolean :support_required, :default => false
      t.text :means_to_support_family, :default => ''
      t.text :work_obligations, :default => ''
      t.text :domestic_obligations, :default => ''
    end
  end

  def self.down
    drop_table :obligations
  end
end
