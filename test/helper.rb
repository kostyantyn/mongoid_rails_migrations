$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'bundler/setup'
Bundler.require(:development_mongoid_rails_migrations)

require 'config'
require 'test/unit'