require 'rake'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:cucumber) do |t|
  t.profile = 'default'
end


desc "Run all features for Platform"
Cucumber::Rake::Task.new(:platform) do |t|
  t.cucumber_opts = %w{
        --profile ci
        --tags @platformapi}
end

desc "Run all features for OddsFeed"
Cucumber::Rake::Task.new(:oddsfeed) do |t|
  t.cucumber_opts = %w{
      --profile ci
      --tags @oddsfeed}
end

task :default => :cucumber

Cucumber::Rake::Task.new(:current) do |t|
  t.profile = 'current'
end
