$:.unshift(File.dirname(__FILE__))
namespace :test do
  require 'bundler/setup'
  Bundler.require(:development_mongoid_rails_migrations)

  namespace :mongoid do
    desc "Test mongoid rails migrations"
    task :migrations do
      require 'test/generator_test'
      require 'test/migration_test'
    end
  end
end