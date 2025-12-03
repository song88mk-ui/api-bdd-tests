require 'rake'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:cucumber) do |t|
  t.profile = 'default'
end

task :clean do
  sh "rm -fr results"
end

namespace :internal do

  desc "Run all features for Platform"
  Cucumber::Rake::Task.new(:platform) do |t|
    t.profile = 'ci'
    t.cucumber_opts = %w{--tags @internal --tags @platformapi}
  end

  desc "Run all features for OddsFeed"
  Cucumber::Rake::Task.new(:oddsfeed) do |t|
    t.profile = 'ci'
    t.cucumber_opts = %w{--tags @internal --tags @oddsfeed}
  end

  desc "Run all features with CI profile"
  task :all => [:platform, :oddsfeed]
end

namespace :external do
  Cucumber::Rake::Task.new(:oddsfeed) do |t|
    t.profile = 'ci'
    t.cucumber_opts = %w{--tags @external --tags @oddsfeed}
  end
  Cucumber::Rake::Task.new(:platform) do |t|
    t.profile = 'ci'
    t.cucumber_opts = %w{--tags @external --tags @platformapi}
  end
  desc "Run all features with CI profile"
  task :all => [:platform, :oddsfeed]
end


task :default => :cucumber
Cucumber::Rake::Task.new(:current) do |t|
  t.profile = 'current'
end
