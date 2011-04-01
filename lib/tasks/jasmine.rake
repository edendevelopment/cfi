begin
  require 'jasmine'
  load 'jasmine/tasks/jasmine.rake'
rescue LoadError
  desc 'jasmine rake task not available (cucumber not installed)'
  task :jasmine do
    abort 'jasmine rake task is not available. Be sure to install jasmine as a gem or plugin'
  end
end
