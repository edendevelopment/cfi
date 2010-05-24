require 'factory_girl'

Factory.define :student do |student|
  student.sequence(:name) {|n| "Student #{n}"}
  student.association :village
end

Factory.define :course do |course|

end

Factory.define :user do |user|
  user.sequence(:name) { |n| "User #{n}" }
  user.sequence(:email) { |n| "user_#{n}@example.com" }
  user.password "password"
end

Factory.define :village do |village|
  village.sequence(:name) { |n| "Village #{n}" }
end
