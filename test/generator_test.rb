require File.dirname(__FILE__) + '/helper'

class MongoidRailsMigrationsGeneratorTest < ActiveSupport::TestCase
  def test_next_file_name_when_timestamp_enabled
    timestamp = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
    sleep 1

    generator = MongoidRailsMigrations::Generator.new('my_class_name', MIGRATIONS_ROOT + '/valid')
    file_name = generator.next_file_name

    version, class_name = File.basename(file_name, '.rb').split('_', 2)

    assert_true timestamp < version.to_i
    assert_equal class_name, 'my_class_name'
  end

  def test_content
    content = "class MyClassName < Mongoid::Migration\n" \
              "  def self.up\n" \
              "  end\n\n" \
              "  def self.down\n" \
              "  end\n" \
              "end"

    generator = MongoidRailsMigrations::Generator.new('my_class_name', '')
    assert_equal generator.content, content
  end
end