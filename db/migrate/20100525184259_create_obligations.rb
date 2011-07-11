class CreateObligations < ActiveRecord::Migration
  def self.up
    create_table :obligations do |t|
      t.references :person
      t.boolean :support_required, :default => false
      t.text :means_to_support_family
      t.text :work_obligations
      t.text :domestic_obligations
    end
  end

  def self.down
    drop_table :obligations
  end
end
