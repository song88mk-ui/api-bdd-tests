require 'rake'
require 'cucumber/rake/task'
require 'dotenv'

Cucumber::Rake::Task.new(:cucumber) do |t|
  t.profile = 'default'
end

task :clean do
  sh "rm -fr results"
end

task :prepare do
  sh "mkdir results"
end

namespace :internal do

  desc "Run all features for Platform"
  Cucumber::Rake::Task.new(:platform) do |t|
    t.profile = ['default', 'ci', 'html', 'skip_known']
    t.cucumber_opts = %w{--tags @internal --tags @platformapi}
  end

  desc "Run all features for OddsFeed"
  Cucumber::Rake::Task.new(:oddsfeed) do |t|
    t.profile = ['default', 'ci', 'html', 'skip_known']
    t.cucumber_opts = %w{--tags @internal --tags @oddsfeed}
  end

  desc "Run all features with CI profile"
  task :all => [:platform, :oddsfeed]
end

namespace :external do
  Cucumber::Rake::Task.new(:oddsfeed) do |t|
    t.profile = ['default', 'ci', 'html', 'skip_known']
    t.cucumber_opts = %w{--tags @external --tags @oddsfeed}
  end
  Cucumber::Rake::Task.new(:platform) do |t|
    t.profile = ['default', 'ci', 'html', 'skip_known']
    t.cucumber_opts = %w{--tags @external --tags @platformapi --tags @hello}
  end

  desc "Run all features with CI profile"
  task :all => [:clean, :prepare, :platform, :oddsfeed]
end

task :default => :cucumber
Cucumber::Rake::Task.new(:current) do |t|
  t.profile = 'current'
end

task :platform => [:clean, :prepare, 'external:platform'] do |t|
  if !ENV['CI'] then
    puts "Skipping report submission"
    exit
  end

  require_relative 'utils/report'
  Report.submit("Platform API - Public Endpoints", "results/index.html", "C0A1QRRDSF7")
end

task :oddsfeed => [:clean, :prepare, 'external:oddsfeed'] do |t|
  if !ENV['CI'] then
    puts "Skipping report submission"
    exit
  end

  require_relative 'utils/report'
  Report.submit("OddsFeed API", "results/index.html", "C0A1QRRDSF7")
end
