require 'rubygems'
require 'active_support'
require 'active_support/test_case'
require 'test/unit'
require 'sqlite3'
require 'active_record'
require File.expand_path(File.join(File.dirname(__FILE__), '../init.rb'))

ActiveRecord::Base.establish_connection(
  :adapter  => "sqlite3",
  :database => ":memory:"
)

load File.expand_path(File.join(File.dirname(__FILE__), 'db/schema.rb'))
