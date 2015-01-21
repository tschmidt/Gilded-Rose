require 'rubygems'
require 'bundler'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'rake'
require 'rake/testtask'

Rake::TestTask.new do |task|
  task.libs << 'lib' << 'test'
  task.pattern = 'test/**/*_test.rb'
  task.verbose = false
end

task default: [:test]