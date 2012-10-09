# encoding: utf-8
require 'bundler/setup'
Bundler.require(:mongoid_rails_migrations)

# Add base to path incase not included as a gem
$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'mongoid_rails_migrations/version'
require 'mongoid_rails_migrations/generator'
require 'mongoid_rails_migrations/data_migration'
require 'mongoid_rails_migrations/migrations'
