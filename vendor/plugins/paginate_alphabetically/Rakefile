require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "paginate_alphabetically"
    gem.summary = %Q{An easy way to paginate a list of ActiveRecord objects alphabetically by any given attribute.}
    gem.description = %Q{Provides a list of available letters, and a way of fetching the records for each letter.}
    gem.email = "dev+gems@edendevelopment.co.uk"
    gem.homepage = "http://github.com/edendevelopment/paginate_alphabetically"
    gem.authors = ["Eden Development"]
    gem.add_development_dependency "activerecord", ">= 2.3.5"
    gem.add_development_dependency "mocha"
    gem.add_development_dependency "sqlite3-ruby", "1.2.5"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/test_*.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :test => :check_dependencies

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "paginate_alphabetically #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
