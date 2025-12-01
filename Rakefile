require 'rake'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:cucumber) do |t|
  t.profile = 'default'
end

namespace :internal do

  desc "Run all features for Platform"
  Cucumber::Rake::Task.new(:platform) do |t|
    t.cucumber_opts = %w{
          --profile ci
          --tags @platformapi
          --tags @internal}
  end

  desc "Run all features for OddsFeed"
  Cucumber::Rake::Task.new(:oddsfeed) do |t|
    t.cucumber_opts = %w{
        --profile ci
        --tags @oddsfeed
        --tags @internal}
  end

  desc "Run all features with CI profile"
  task :all => [:platform, :oddsfeed]
end


Cucumber::Rake::Task.new(:external) do |t|
  t.profile = 'ci'
  t.cucumber_opts = %w{--tags @external}
end

task :default => :cucumber
Cucumber::Rake::Task.new(:current) do |t|
  t.profile = 'current'
end
