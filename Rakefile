require 'bundler/gem_tasks'
require 'rake/testtask'

namespace :test do
  desc 'Run integration tests'
  Rake::TestTask.new(:integration) do |t|
    t.libs << 'test/integration'
    t.pattern = 'test/integration/*_test.rb'
  end

  Rake::TestTask.new(:unit) do |t|
    t.libs << 'test/unit'
    t.pattern = 'test/unit/*_test.rb'
  end
end

desc 'Run tests'
task :test => Rake::Task["test:unit"]
task :default => :test