require File.join(File.dirname(__FILE__), '..', 'lib', 'mongoid_rails_migrations')

Mongoid.configure.connect_to('mongoid_test')

# require all models
Dir[File.join(File.dirname(__FILE__), 'models', '*.rb')].each { |file| require file }

MIGRATIONS_ROOT = File.join(File.dirname(__FILE__), 'migrations')