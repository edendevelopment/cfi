namespace :ci do
  task :copy_yml do
    system("cp #{Rails.root}/config/database.yml.sample #{Rails.root}/config/database.yml")
  end

  task :link_metrics do
    shared_metrics_path = Rails.root.join("..","..","..","metrics","cfi")
    local_metrics_path = Rails.root.join("tmp", "metric_fu")
    system("mkdir -p #{shared_metrics_path}")
    system("mkdir -p #{Rails.root.join("tmp")}")
    system("ln -snf #{shared_metrics_path} #{local_metrics_path}")
  end

  desc "Prepare for CI and run entire test suite"
  task :build => ['ci:copy_yml', 'db:migrate', 'spec', 'cucumber']
end
