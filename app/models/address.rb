class Address < ActiveRecord::Base
  belongs_to :village
  belongs_to :person
end