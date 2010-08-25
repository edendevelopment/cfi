ActiveRecord::Schema.define do
  create_table "things", :force => true do |t|
    t.column "name",  :text
  end
end
