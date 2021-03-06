require File.join(File.dirname(__FILE__), 'lib', 'mongoid_rails_migrations', 'version')

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'mongoid_rails_migrations'
  s.version     = MongoidRailsMigrations::VERSION
  s.summary     = 'Data migrations for Mongoid in Active Record style, minus column input.'
  s.description = 'Migrations for the migrator.'

  # only tested with 1.9.1, but let's go for it
  s.required_ruby_version     = '>= 1.8.6'
  s.required_rubygems_version = '>= 1.3.6'

  s.author            = 'Alan Da Costa'
  s.email             = 'alandacosta@gmail.com.com'
  s.date              = %q{2012-09-04}
  s.homepage          = 'http://github.com/adacosta/mongoid_rails_migrations'

  s.require_paths = ['lib']
  s.files         = Dir['.gitignore', 'Gemfile', 'Gemfile.lock', 'Rakefile', 'README.rdoc', 'mongoid_rails_migrations.gemspec', 'lib/**/*']
  s.test_files    = Dir['test/**/*']
  s.has_rdoc      = false

  s.add_dependency('bundler', '>= 1.0.0')
  s.add_dependency('activesupport',  '>= 3.2.0')
  s.add_development_dependency('mongoid', '>= 3.0.0')
  s.add_development_dependency('test-unit', '>= 2.5.0')
end