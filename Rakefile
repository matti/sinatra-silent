require "bundler/gem_tasks"
require "rspec/core/rake_task"

require "parallel_tests/tasks"
require "kommando"

RSpec::Core::RakeTask.new(:spec)

task default: ["parallel:spec", :e2e]

task :e2e do
  k = Kommando.run "ruby e2e/all.rb", output: true
  raise "not clean" unless k.code == 0
end
