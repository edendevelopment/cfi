# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
#<<<<<<< HEAD
require 'rake/dsl_definition' 
#=======
require 'rake/dsl_definition'
#>>>>>>> edendevelopment/master
require 'rake'

task :default => [:"cucumber:all", :spec]

Cfi::Application.load_tasks
#<<<<<<< HEAD
module ::Cfi_aberdeen
  class Application
    include Rake::DSL
  end
end 
#=======
#>>>>>>> edendevelopment/master
