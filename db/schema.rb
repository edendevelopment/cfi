# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110626201229) do

  create_table "addresses", :force => true do |t|
    t.integer "person_id"
    t.string  "house_number", :default => ""
    t.string  "group_number", :default => ""
    t.integer "village_id"
  end

  create_table "comments", :force => true do |t|
    t.string   "title",            :limit => 50
    t.text     "comment"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_uid"
  end

  add_index "comments", ["commentable_id"], :name => "index_comments_on_commentable_id"
  add_index "comments", ["commentable_type"], :name => "index_comments_on_commentable_type"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "configurables", :force => true do |t|
    t.string   "name"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "configurables", ["name"], :name => "index_configurables_on_name"

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.string   "time"
    t.string   "schedule"
    t.string   "teacher"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses_students", :id => false, :force => true do |t|
    t.integer "course_id"
    t.integer "student_id"
  end

  create_table "households", :force => true do |t|
    t.string   "caretaker"
    t.string   "description"
    t.string   "contact_information"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_uid"
  end

  create_table "obligations", :force => true do |t|
    t.integer "person_id"
    t.boolean "support_required",        :default => false
    t.text    "means_to_support_family"
    t.text    "work_obligations"
    t.text    "domestic_obligations"
  end

  create_table "people", :force => true do |t|
    t.string   "name"
    t.date     "date_of_birth"
    t.string   "gender"
    t.text     "siblings"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_uid"
    t.string   "religion",                :default => ""
    t.boolean  "date_of_birth_confirmed", :default => false, :null => false
    t.integer  "household_id"
  end

  create_table "photos", :force => true do |t|
    t.integer  "person_id"
    t.text     "comment"
    t.string   "image_uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "public_education_infos", :force => true do |t|
    t.integer "person_id"
    t.boolean "attending",           :default => false
    t.string  "grade"
    t.text    "performance"
    t.text    "attendance_patterns"
    t.text    "past_attendance"
    t.text    "name_of_schools"
    t.text    "school_contact"
  end

  create_table "relationships", :force => true do |t|
    t.integer  "from_id"
    t.integer  "to_id"
    t.string   "relationship_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "social_development_infos", :force => true do |t|
    t.integer "person_id"
    t.text    "type_of_housing"
    t.text    "permanence_of_housing"
    t.text    "access_to_cfi_school"
    t.text    "seasonal_factors"
    t.text    "support_from_other_organisations"
    t.text    "barriers_to_attending_public_school"
    t.text    "ideas_of_carers_about_education"
    t.text    "other_social_issues_or_dangers"
    t.text    "history_of_abuse"
    t.text    "observations_from_visits"
  end

  create_table "students", :force => true do |t|
    t.integer "person_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "",    :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "",    :null => false
    t.string   "password_salt",                       :default => "",    :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                                :default => ""
    t.boolean  "social_worker",                       :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "villages", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
