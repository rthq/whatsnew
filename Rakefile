require "bundler/gem_tasks"
require 'rake/testtask'

task default: :test

Rake::TestTask.new do |t|
  t.libs << %w(test lib)
  t.pattern = "test/**/test_*.rb"
end