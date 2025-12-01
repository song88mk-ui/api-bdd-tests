require 'rake'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:cucumber) do |t|
  t.profile = 'default'
end


task :default => :cucumber

Cucumber::Rake::Task.new(:ci) do |t|
  t.profile = 'ci'
end

Cucumber::Rake::Task.new(:current) do |t|
  t.profile = 'current'
end
