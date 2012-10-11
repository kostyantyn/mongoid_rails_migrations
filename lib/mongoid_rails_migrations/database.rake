namespace :db do
  desc 'Create migration: rake db:create_migration migration=create_new_column'
  task :create_migration do
    require 'active_support/all'
    require 'mongoid_rails_migrations/generator'

    migration = ENV['migration']
    raise 'Migration name cannot be blank' if migration.blank?

    generator = MongoidRailsMigrations::Generator.new(migration, 'db/migrations')
    migration_file = generator.create
    Logger.new(STDOUT).info(%(Migration file was created in the following directory "#{migration_file}"))
  end

  desc 'Current database version'
  task version: :environment do
    puts Mongoid::Migrator.current_version.to_s
  end

  desc "Migrate the database through scripts in db/migrations. Target specific version with VERSION=x. Turn off output with VERBOSE=false."
  task migrate: :environment do
    Mongoid::Migration.verbose = ENV['VERBOSE'] ? ENV['VERBOSE'] == 'true' : true
    Mongoid::Migrator.migrate('db/migrations', ENV['VERSION'] ? ENV['VERSION'].to_i : nil)
  end

  namespace :migrate do
    desc  'Rollback the database one migration and re migrate up. If you want to rollback more than one step, define STEP=x. Target specific version with VERSION=x.'
    task redo: :environment do
      if ENV['VERSION']
        Rake::Task['db:migrate:down'].invoke
        Rake::Task['db:migrate:up'].invoke
      else
        Rake::Task['db:rollback'].invoke
        Rake::Task['db:migrate'].invoke
      end
    end

    desc 'Resets your database using your migrations for the current environment'
    # should db:create be changed to db:setup? It makes more sense wanting to seed
    task reset: %w[db:drop db:create db:migrate]

    desc 'Runs the "up" for a given migration VERSION.'
    task up: :environment do
      version = ENV['VERSION'] ? ENV['VERSION'].to_i : nil
      raise 'VERSION is required' unless version
      Mongoid::Migrator.run(:up, 'db/migrations', version)
    end

    desc 'Runs the "down" for a given migration VERSION.'
    task down: :environment do
      version = ENV['VERSION'] ? ENV['VERSION'].to_i : nil
      raise 'VERSION is required' unless version
      Mongoid::Migrator.run(:down, 'db/migrations', version)
    end
  end

  desc 'Rolls the database back to the previous migration. Specify the number of steps with STEP=n'
  task rollback: :environment do
    step = ENV['STEP'] ? ENV['STEP'].to_i : 1
    Mongoid::Migrator.rollback('db/migrations', step)
  end
end