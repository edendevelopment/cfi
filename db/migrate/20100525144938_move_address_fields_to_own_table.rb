class MoveAddressFieldsToOwnTable < ActiveRecord::Migration
  class Person < ActiveRecord::Base
    
  end
  class Address < ActiveRecord::Base
    
  end
  
  def self.up
    create_table :addresses, :force => true do |t|
      t.references :person
      t.string :house_number, :default => ""
      t.string :group_number, :default => ""
      t.references :village
    end
    
    Person.all.each do |person|
      next if person.house_number.blank? && person.group_number.blank? && person.village_id.blank?
      Address.create! :person_id => person.id, :house_number => person.house_number, :group_number => person.group_number, :village_id => person.village_id
    end
    
    remove_column :people, :house_number
    remove_column :people, :group_number
    remove_column :people, :village_id
  end

  def self.down
    add_column :people, :house_number, :string, :default => ""
    add_column :people, :group_number, :string, :default => ""
    add_column :people, :village_id, :integer
    
    Person.all.each do |person|
      address = Address.find_by_person_id(person.id)
      next unless address
      person.house_number = address.house_number
      person.group_number = address.group_number
      person.village_id = address.village_id
      person.save
    end
    
    drop_table :addresses
  end
end
