require 'factory_girl'

Factory.define :person do |person|
  person.gender "Male"
  person.sequence(:name) {|n| "Person #{n}"}
  person.association :address
end

Factory.define :student do |student|
  student.association :person
end

Factory.define :course do |course|
  course.sequence(:name) {|n| "Course #{n}"}
end

Factory.define :household do |household|
  household.sequence(:caretaker) {|n| "Household #{n}"}
end

Factory.define :user do |user|
  user.sequence(:name) { |n| "User #{n}" }
  user.sequence(:email) { |n| "user_#{n}@example.com" }
  user.password "password"
end

Factory.define :village do |village|
  village.sequence(:name) { |n| "Village #{n}" }
end

Factory.define :address do |address|
  
end
