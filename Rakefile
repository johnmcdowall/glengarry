#!/usr/bin/env rake
begin
  require 'bundler/setup'
  require 'rails/all'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end


task :default => :spec

Bundler::GemHelper.install_tasks
