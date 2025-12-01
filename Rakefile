require 'rake'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:cucumber) do |t|
  t.profile = 'default'
end

namespace :cucumber do

  Cucumber::Rake::Task.new(:platform) do |t|
    t.cucumber_opts = %w{--format pretty
          --publish-quiet
          --profile current
          --tags @plarformapi}
  end

  Cucumber::Rake::Task.new(:ci) do |t|
    #t.profile = 'ci'
    t.cucumber_opts = %w{--format pretty
        --format junit
        --require features
        --publish-quiet
        --out results/junit
        --tags @oddsfeed
        }
  end

  task :default => :cucumber
end

Cucumber::Rake::Task.new(:current) do |t|
  t.profile = 'current'
end
