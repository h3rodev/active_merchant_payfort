require 'rake'
require 'rake/testtask'
require 'rdoc/task'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the active_merchant_payfort plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the active_merchant_payfort plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'ActiveMerchantPayfort'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "active_merchant_payfort"
    gemspec.summary = "A plugin for Payfort support in ActiveRecord."
    gemspec.description = "A plugin for Payfort support in ActiveRecord. "
    gemspec.email = "github@defv.be"
    gemspec.homepage = "http://github.com/DefV/active_merchant_payfort/tree/master"
    gemspec.authors = ["Jan De Poorter", "Simon Menke"]
    gemspec.add_dependency 'activemerchant', '>= 1.4.2'
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end
